part of 'qr_cubit.dart';

sealed class QrState {}

final class QrInitial extends QrState {}

final class QrLoading extends QrState {}

final class QrSuccses extends QrState {}

final class QrFailure extends QrState {}
