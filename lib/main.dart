import 'package:NourishBite/core/pages/homepage.dart';
import 'package:NourishBite/core/pages/login.dart';
import 'package:NourishBite/core/utils/controllers/auth_controller.dart';
import 'package:NourishBite/core/utils/controllers/donation_controller.dart';
import 'package:NourishBite/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'core/app_export.dart';
import 'package:get/get.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final homeC = Get.put(DonationController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return StreamBuilder<User?>(
          stream: authC.authStatus,
          builder: (context, snapshot) {
            return GetMaterialApp(
              theme: theme,
              title: 'nourishBite',
              debugShowCheckedModeBanner: false,
              home: snapshot.hasData ? HomePage() : LoginScreen(),
              routes: AppRoutes.routes,
            );
          },
        );
      },
    );
  }
}
