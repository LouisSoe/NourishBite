import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/core/utils/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPageScreen extends StatelessWidget {
  AdminPageScreen({Key? key})
      : super(
          key: key,
        );

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.blueGray800,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLogin,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 42.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDashboardSection(context),
                SizedBox(height: 47.v),
                Text(
                  "Menus",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(height: 6.v),
                _buildAdminPageSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDashboardSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 69.v,
            width: 160.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.h),
                    child: Text(
                      " Dashboard",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSubtract,
                  height: 39.v,
                  width: 33.h,
                  alignment: Alignment.topLeft,
                  color: const Color.fromARGB(255, 255, 182, 0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Container(
                    margin: EdgeInsets.only(top: 15.v),
                    decoration: AppDecoration.outlineBlack,
                    child: Text(
                      "ourishBite",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.logouticon,
            height: 27.adaptSize,
            width: 27.adaptSize,
            color: const Color.fromARGB(255, 255, 182, 0),
            margin: EdgeInsets.only(
              top: 12.v,
              bottom: 30.v,
            ),
            // logout f
            onTap: () => authC.signOut(),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAdminPageSection(BuildContext context) {
    List<AdminMenuItem> menuItems = [
      AdminMenuItem(
          "Donation", ImageConstant.imgdonation, AppRoutes.donatepageadmin),
      AdminMenuItem("Distribution", ImageConstant.mapmarkedicon,
          AppRoutes.distributionadmin),
      AdminMenuItem(
          "User", ImageConstant.userroundedicon, AppRoutes.userpageadmin),
      AdminMenuItem(
          "Food Bank", ImageConstant.foodbankicon, AppRoutes.foodbankadmin),
    ];
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 142.v,
          crossAxisCount: 2,
          mainAxisSpacing: 25.h,
          crossAxisSpacing: 25.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          AdminMenuItem menuItem = menuItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, menuItem.route);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.outlineBlack90001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 14.v),
                  CustomImageView(
                    imagePath: menuItem.imagePath,
                    height: 50.v,
                    width: 55.h,
                    color: const Color.fromARGB(255, 255, 182, 0),
                  ),
                  SizedBox(height: 7.v),
                  Text(
                    menuItem.label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AdminMenuItem {
  final String label;
  final String imagePath;
  final String route;
  AdminMenuItem(this.label, this.imagePath, this.route);
}
