part of 'qr_cubit.dart';

sealed class QrState {}

final class QrInitial extends QrState {}

final class QrLoading extends QrState {}

final class QrSuccess extends QrState {
  final ProductEntite prodcutEntite;

  QrSuccess({required this.prodcutEntite});
}

final class QrFailure extends QrState {
  final String message;

  QrFailure(this.message);
}
