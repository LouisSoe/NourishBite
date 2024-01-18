import 'package:NourishBite/core/pages/admin/dashboard.dart';
import 'package:NourishBite/core/pages/admin/form_foodbank.dart';
import 'package:NourishBite/core/pages/admin/form_program.dart';
import 'package:NourishBite/core/pages/admin/program.dart';
import 'package:NourishBite/core/pages/donationfood.dart';
import 'package:NourishBite/core/pages/homepage.dart';
import 'package:NourishBite/core/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/pages/login.dart';
import 'package:NourishBite/core/pages/register.dart';
import 'package:NourishBite/core/pages/donation.dart';
import 'package:NourishBite/core/pages/pilih_donasi.dart';
import 'package:NourishBite/core/pages/donationmoney.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String mapsScreen = '/maps';
  static const String registerScreen = '/register';
  static const String homePage = '/home';
  static const String donation = '/donation';
  static const String pilihdonasi = '/pilih_donasi';
  static const String donationmoney = '/donasi_money';
  static const String donationfood = '/donasi_food';
  static const String dashboard = '/dashboard';
  static const String program = '/program';
  static const String formprogram = '/form_program';
  static const String formfoodbank = '/form_foodbank';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homePage: (context) => HomePage(),
    mapsScreen: (context) => Maps(),
    donation: (context) => DonateScreen(),
    pilihdonasi: (context) => DontationStageScreen(),
    donationmoney: (context) => DontationMoneyScreen(),
    donationfood: (context) => DonationFood(),
    dashboard: (context) => DashboardPage(),
    program: (context) => Program(),
    formprogram: (context) => FormProgram(),
    formfoodbank: (context) => FormFoodBank(),
  };
}
