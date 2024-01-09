import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/core/utils/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => authC.signOut(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.mapsScreen),
          child: Icon(
            Icons.map,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
