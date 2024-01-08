import 'package:flutter/material.dart';
import 'package:NourishBite/core/pages/login.dart';
import 'package:NourishBite/core/pages/register.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen()
  };
}
