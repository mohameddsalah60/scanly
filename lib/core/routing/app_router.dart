import 'package:flutter/material.dart';

import '../../features/splash/presentation/views/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text('404 Not Found'))),
        );
    }
  }
}
