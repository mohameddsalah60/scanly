import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../cubit/qr_cubit.dart';

class QrCodeImage extends StatelessWidget {
  const QrCodeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QrImageView(
        data: context.watch<QrCubit>().qrData,
        version: QrVersions.auto,
        gapless: false,
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: AppColors.secondary,
        ),
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
