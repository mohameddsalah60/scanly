import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_routes.dart';
import 'core/utils/app_colors.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1660, 1080),
      minTextAdapt: true,
      child: MaterialApp(
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: AppColors.secondary,
            displayColor: AppColors.secondary,
          ),
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
