import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.onSaved,
    this.fillColor,
    this.controller,
    this.onChanged,
    this.validator,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? fillColor;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required .';
            }
            return null;
          },
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.secondary,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.secondary,
        filled: true,
        fillColor: fillColor ?? AppColors.background,
        hintText: hintText,
        hintStyle: AppTextStyles.fontWeight500Size14.copyWith(
          fontSize: 20.sp,
          color: AppColors.greyDark,
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      textAlign: TextAlign.start,
      style: AppTextStyles.fontWeight500Size14.copyWith(
        fontSize: 20.sp,
        color: AppColors.secondary,
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1.3.w, color: AppColors.secondary),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
