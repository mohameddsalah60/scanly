import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Generate Codes Instantly.',
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24.h),
        Text(
          'Create professional QR codes and barcodes for any text or numper. \n Use your voice, type it in, or scan existing codes.',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
