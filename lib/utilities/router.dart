import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_tarek/utilities/routes.dart';
import 'package:flutter_ecommerce_tarek/views/pages/bottom_navbar.dart';
import 'package:flutter_ecommerce_tarek/views/pages/landing_page.dart';

import '../views/pages/auth_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.bottomNavBarRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavbar(),
        settings: settings,
      );
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
