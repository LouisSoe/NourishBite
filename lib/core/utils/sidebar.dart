import 'package:NourishBite/core/utils/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/theme_helper.dart';

class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: Text(
              "NourishBite",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: theme.primaryColor,
              ),
            ),
            width: double.infinity,
            height: 100,
          ),
          ListMenu(
            title: "Dashboard",
            icon: Icon(Icons.home),
            page: AppRoutes.dashboard,
          ),
          ListMenu(
            title: 'Program',
            icon: Icon(Icons.card_giftcard),
            page: AppRoutes.program,
          ),
          InkWell(
              onTap: () => authC.signOut(),
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.door_back_door),
              ))
          // ListMenu(),
          // ListMenu(),
        ],
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final String title;
  final Icon icon;
  final String page;
  const ListMenu({
    required this.title,
    required this.icon,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(page),
      child: ListTile(
        leading: icon,
        title: Text(title),
      ),
    );
  }
}
