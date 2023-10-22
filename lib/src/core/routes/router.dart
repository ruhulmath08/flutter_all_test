import 'package:flutter/material.dart';
import 'package:flutter_all_test/src/core/routes/routing_constants.dart';
import 'package:flutter_all_test/src/features/home/home_page.dart';
import 'package:flutter_all_test/src/features/login/login_page.dart';

Route<MaterialPageRoute>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case loginPageRoute:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

    case homePageRoute:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

    default:
      return null;
  }
}
