import 'package:NourishBite/widgets/dynamicviewlist_item_widget.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:NourishBite/widgets/custom_text_form_field.dart';

class DistributionScreen extends StatelessWidget {
  DistributionScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: GNav(
              gap: 2,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              backgroundColor: const Color.fromARGB(255, 35, 74, 64),
              color: const Color.fromARGB(255, 255, 182, 0),
              activeColor: const Color.fromARGB(255, 255, 182, 0),
              tabBackgroundColor: Color.fromARGB(255, 41, 90, 77),
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.volunteer_activism, text: "Donate"),
                GButton(icon: Icons.map_rounded, text: "Distribution"),
                GButton(icon: Icons.account_circle, text: "Profile"),
              ],
              selectedIndex: 2,
              onTabChange: (index) {
                switch (index) {
                  case 0:
                    // Navigate to Home route
                    Get.toNamed(AppRoutes.homePage);
                    break;
                  case 1:
                    // Navigate to Donate route
                    Get.toNamed(AppRoutes.donation);
                    break;
                  case 2:
                    // Navigate to Donate route
                    Get.toNamed(AppRoutes.distribution);
                    break;
                  case 3:
                    // Navigate to Donate route
                    Get.toNamed(AppRoutes.profile);
                    break;
                }
              }),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 21.h,
                vertical: 15.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11.v),
                  Container(
                    width: 337.h,
                    margin: EdgeInsets.only(right: 10.h),
                    child: Text(
                      "Select a place to get food from \nthe distribution",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 22.v),
                  CustomTextFormField(
                    autofocus: false,
                    fillColor: Colors.white,
                    borderDecoration: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Customize border color
                    ),
                    controller: searchController,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    textStyle: TextStyle(color: Colors.grey),
                    textInputType: TextInputType.emailAddress,
                    prefix: Container(
                        margin: EdgeInsets.fromLTRB(11.h, 10.v, 8.h, 10.v),
                        child: Icon(
                          Icons.search,
                          size: 25.adaptSize,
                          color: Colors.grey,
                        )),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 42.v,
                    ),
                  ),
                  SizedBox(height: 20.v),
                  CustomElevatedButton(
                    width: 193.h,
                    text: "Find nearest distribution",
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.nearestdistribution);
                    },
                    buttonTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildFeatureDistributionRow(context),
                  SizedBox(
                    height: 10,
                  ),
                  _buildDynamicViewList(context),
                ],
              ),
            ),
          )),
    );
  }

  /// Section Widget
  Widget _buildFeatureDistributionRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 12.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Feature Distribution",
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
          Spacer(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDynamicViewList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 21.v,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.detaildistribution);
              },
              child: DynamicviewlistItemWidget());
        },
      ),
    );
  }
}
