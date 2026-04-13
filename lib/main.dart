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
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,

      body: Center(child: Text('welcome')),
    );
  }
}
