import 'package:NourishBite/core/pages/homepage.dart';
import 'package:NourishBite/core/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/pages/login.dart';
import 'package:NourishBite/core/pages/register.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String mapsScreen = '/maps';
  static const String registerScreen = '/register';
  static const String homePage = '/home';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homePage: (context) => HomePage(),
    mapsScreen: (context) => Maps(),
  };
}
