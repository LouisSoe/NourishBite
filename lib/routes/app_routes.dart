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

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homePage: (context) => HomePage(),
    mapsScreen: (context) => Maps(),
    donation: (context) => DonateScreen(),
    pilihdonasi: (context) => DontationStageScreen(),
    donationmoney: (context) => DontationMoneyScreen(),
    donationfood: (context) => DonationFood(),
  };
}
