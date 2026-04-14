import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ProductsRepository {
  Map<String, dynamic> _data = {};

  bool _isLoaded = false;

  Future<void> load() async {
    if (_isLoaded) return;

    final jsonString = await rootBundle.loadString('data/products.json');

    _data = json.decode(jsonString);

    _isLoaded = true;
  }

  Map<String, dynamic>? getBySku(String sku) {
    return _data[sku];
  }

  String extractFirstBarcode(String value) {
    final cleaned = value.trim();

    if (cleaned.contains(',') ||
        cleaned.contains(' ') ||
        cleaned.contains('-')) {
      return cleaned.split(RegExp(r'[,\s\-]')).first.trim();
    }

    if (cleaned.length >= 13) {
      return cleaned.substring(0, 13);
    }

    return cleaned;
  }
}
