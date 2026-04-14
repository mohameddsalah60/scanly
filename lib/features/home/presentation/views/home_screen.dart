import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scanly/core/utils/app_colors.dart';
import 'package:scanly/features/home/presentation/cubit/qr_cubit.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_text.dart';
import 'widgets/qr_code_form.dart';
import 'widgets/qr_image_.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: 36.h),
          HomeText(),
          SizedBox(height: 36.h),
          BlocProvider(
            create: (context) => QrCubit(),
            child: Container(
              width: 900.w,
              height: 450.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [QrCodeForm(), SizedBox(width: 48.w), QrCodeImage()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
