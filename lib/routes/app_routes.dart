import 'package:NourishBite/core/pages/dashboard/form_donation.dart';
import 'package:NourishBite/core/pages/dashboard/form_foodbank.dart';
import 'package:NourishBite/core/pages/dashboard/form_program.dart';
import 'package:NourishBite/core/pages/donationfood.dart';
import 'package:NourishBite/core/pages/homepage.dart';
import 'package:NourishBite/core/pages/maps.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/pages/login.dart';
import 'package:NourishBite/core/pages/register.dart';
import 'package:NourishBite/core/pages/donation.dart';
import 'package:NourishBite/core/pages/distribution.dart';
import 'package:NourishBite/core/pages/detail_distribution.dart';
import 'package:NourishBite/core/pages/nearestdistribution.dart';
import 'package:NourishBite/core/pages/pilih_donasi.dart';
import 'package:NourishBite/core/pages/donationmoney.dart';
import 'package:NourishBite/core/pages/detail_donation.dart';
import 'package:NourishBite/core/pages/dashboard/dashboardpage.dart';
import 'package:NourishBite/core/pages/dashboard/distributionpageadmin.dart';
import 'package:NourishBite/core/pages/dashboard/donatepageadmin.dart';
import 'package:NourishBite/core/pages/dashboard/foodbankadmin.dart';
import 'package:NourishBite/core/pages/dashboard/userpageadmin.dart';
import 'package:NourishBite/core/pages/profile.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';
  static const String mapsScreen = '/maps';
  static const String registerScreen = '/register';
  static const String homePage = '/home';
  static const String donation = '/donation';
  static const String detaildonation = '/detail_donasi';
  static const String distribution = '/distribution';
  static const String detaildistribution = '/detaildistribution';
  static const String nearestdistribution = '/nearestdistribution';
  static const String pilihdonasi = '/pilih_donasi';
  static const String donationmoney = '/donasi_money';
  static const String donationfood = '/donasi_food';
  static const String dashboard = '/dashboard';
  static const String foodbankform = '/foodbank_form';
  static const String distributionform = '/distribution_form';
  static const String donationform = '/donation_form';
  static const String distributionadmin = '/distributionadmin';
  static const String donatepageadmin = '/donatepageadmin';
  static const String foodbankadmin = '/foodbankadmin';
  static const String userpageadmin = '/userpageadmin';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homePage: (context) => HomePage(),
    mapsScreen: (context) => Maps(),
    donation: (context) => DonateScreen(),
    distribution: (context) => DistributionScreen(),
    detaildonation: (context) => DetailDonasi(),
    pilihdonasi: (context) => DontationStageScreen(),
    donationmoney: (context) => DontationMoneyScreen(),
    donationfood: (context) => DonationFood(),
    nearestdistribution: (context) => Nearestdistribution(),
    dashboard: (context) => AdminPageScreen(),
    donatepageadmin: (context) => Donatepageadmin(),
    profile: (context) => ProfilePage(),
    userpageadmin: (context) => Userpageadmin(),
    foodbankadmin: (context) => Foodbankadmin(),
    donationform: (context) => FormDonation(),
    distributionadmin: (context) => DistributionAdminScreen(),
    foodbankform: (context) => FormFoodBank(),
    distributionform: (context) => FormProgram(),
  };
}
