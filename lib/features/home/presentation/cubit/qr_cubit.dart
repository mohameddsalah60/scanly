import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scanly/features/home/domin/enitites/prodcut_entite.dart';
import '../../../../core/repo/products_repo.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit(this._repository) : super(QrInitial());

  final ProductsRepository _repository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController qrController = TextEditingController();
  ProductEntite prodcutEntite = ProductEntite('', '', '');
  String qrData = '';
  Future<void> init() async {
    try {
      emit(QrLoading());
      await _repository.load();
      emit(QrInitial());
    } catch (e) {
      emit(QrFailure("Failed to load data"));
    }
  }

  Future<void> createQR() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final sku = qrController.text.trim();
    await searchBySku(sku);
  }

  Future<void> searchBySku(String sku) async {
    try {
      emit(QrLoading());

      final product = _repository.getBySku(sku);

      if (product == null) {
        emit(QrFailure("Product not found"));
        return;
      }

      final entity = ProductEntite.fromJson(product);
      entity.barcode = _repository.extractFirstBarcode(entity.barcode);
      prodcutEntite = entity;
      qrData = _repository.extractFirstBarcode(entity.barcode);
      log(
        "Product found: ${entity.name}, Barcode: ${_repository.extractFirstBarcode(entity.barcode)}",
      );

      emit(QrSuccess(prodcutEntite: entity));
    } catch (e) {
      emit(QrFailure("Unexpected error occurred"));
    }
  }

  void reset() {
    qrController.clear();
    emit(QrInitial());
  }

  @override
  Future<void> close() {
    qrController.dispose();
    return super.close();
  }
}
