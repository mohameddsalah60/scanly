import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final qrTextFieldController = TextEditingController();
  String? barcode;

  createQR() {
    if (!form.currentState!.validate()) return;
    emit(QrLoading());
    log(qrTextFieldController.text);
  }
}
