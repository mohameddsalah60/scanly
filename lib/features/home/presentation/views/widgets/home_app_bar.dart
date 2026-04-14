import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
      color: AppColors.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.qr_code_sharp, color: AppColors.secondary, size: 32.sp),
          SizedBox(width: 16.w),
          Text(
            'Scanly',
            style: AppTextStyles.fontWeight700Size24.copyWith(
              color: AppColors.secondary,
              fontSize: 26.sp,
            ),
          ),
          Spacer(),
          GestureDetector(
            child: Icon(
              Icons.history_sharp,
              color: AppColors.secondary,
              size: 32.sp,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
