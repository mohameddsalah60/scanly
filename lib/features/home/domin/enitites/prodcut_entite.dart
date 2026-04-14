class ProductEntite {
  final String name, sku;
  String barcode;

  ProductEntite(this.name, this.sku, this.barcode);
  factory ProductEntite.fromJson(Map<String, dynamic> json) {
    return ProductEntite(json['n'] ?? '', json['s'] ?? '', json['b'] ?? '');
  }
}
