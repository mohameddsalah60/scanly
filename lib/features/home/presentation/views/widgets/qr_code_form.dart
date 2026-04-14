import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanly/core/utils/app_colors.dart';
import 'package:scanly/core/utils/app_text_styles.dart';
import 'package:scanly/core/widgets/custom_button.dart';
import 'package:scanly/core/widgets/custom_text_field.dart';
import 'package:scanly/features/home/presentation/cubit/qr_cubit.dart';

class QrCodeForm extends StatelessWidget {
  const QrCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<QrCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.watch<QrCubit>().prodcutEntite.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.fontWeight400Size14.copyWith(
              color: AppColors.secondary,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            context.watch<QrCubit>().prodcutEntite.barcode,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.fontWeight400Size14.copyWith(
              color: AppColors.secondary,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 400.w,
            child: CustomTextFromField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter sku';
                } else {
                  return null;
                }
              },
              controller: context.read<QrCubit>().qrController,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.mic_off_outlined, size: 26.sp),
              ),
              hintText: 'Enter text or number to generate code...',
              onSaved: (value) {
                value != null
                    ? context.read<QrCubit>().qrController.text = value
                    : null;
              },
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: 300.w,
            child: CustomButton(
              icon: Icons.qr_code_rounded,
              onPressed: () {
                context.read<QrCubit>().createQR();
              },
              text: 'Generate Code',
            ),
          ),
        ],
      ),
    );
  }
}
