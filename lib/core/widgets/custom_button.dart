import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.icon,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child:
            isLoading
                ? Center(
                  child: CircularProgressIndicator(color: AppColors.white),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Icon(icon, size: 25.sp, color: AppColors.white)
                        : const SizedBox(),
                    icon != null ? SizedBox(width: 6.w) : const SizedBox(),
                    Text(
                      text,
                      style: AppTextStyles.fontWeight600Size16.copyWith(
                        color: textColor ?? Colors.white,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
