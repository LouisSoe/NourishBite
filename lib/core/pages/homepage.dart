import 'package:NourishBite/core/utils/controllers/auth_controller.dart';
import 'package:NourishBite/core/utils/controllers/donation_controller.dart';
import 'package:NourishBite/widgets/donationcomponentlist_item_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:NourishBite/core/app_export.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );
  final authC = Get.find<AuthController>();
  final donationC = Get.find<DonationController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
              selectedIndex: 0,
              onTabChange: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, AppRoutes.homePage);
                    break;
                  case 1:
                    Navigator.pushNamed(context, AppRoutes.donation);
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
          body: Container(
            width: double.maxFinite,
            decoration: AppDecoration.fillGray,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.h,
                  vertical: 21.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSettingsRow(context),
                    SizedBox(height: 26.v),
                    FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        future: authC.getUserProfile(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            Map<String, dynamic> data = snapshot.data!.data()!;
                            return Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text(
                                "Hello ${data["username"]}",
                                style: TextStyle(
                                  color: appTheme.black900,
                                  fontSize: 24.fSize,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                                padding: EdgeInsets.only(left: 2.h),
                                child: Text("tidak ada user"));
                          }
                        }),
                    SizedBox(height: 5.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Ready to make the world a better place",
                        style: TextStyle(
                          color: appTheme.gray60001,
                          fontSize: 15.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,


                          
                        ),
                      ),
                    ),
                    SizedBox(height: 12.v),
                    _buildNinetySixStack(context),
                    
                    SizedBox(height: 20.v),
                    _buildFeaturedGoalsRow(context),
                    SizedBox(height: 1.v),
                    _buildDonationComponentList(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSettingsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            color: const Color.fromARGB(255, 255, 182, 0),
            imagePath: ImageConstant.imgSubtract,
            height: 35.v,
            width: 30.h,
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgAward,
            height: 18.adaptSize,
            width: 18.adaptSize,
            margin: EdgeInsets.only(top: 15.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              top: 13.v,
              bottom: 2.v,
            ),
            child: GestureDetector(
              child: Text(
                "Achivement",
                style: TextStyle(
                  color: appTheme.black900,
                  fontSize: 15.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNinetySixStack(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.only(left: 2.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Container(
        height: 212.v,
        width: 348.h,
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        decoration: AppDecoration.outlineprimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgorangmakan,
              height: 151.v,
              width: 170.h,
              alignment: Alignment.bottomRight,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.h,
                  top: 12.v,
                  right: 128.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Around  ",
                      style: TextStyle(
                        color: appTheme.whiteA70002,
                        fontSize: 18.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.v),
                    Text(
                      "200,000,000 meals",
                      style: TextStyle(
                        color: appTheme.whiteA70002,
                        fontSize: 22.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 165.h,
                      margin: EdgeInsets.only(right: 40.h),
                      child: Text(
                        "have been donated \nthis month",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: appTheme.whiteA70002,
                          fontSize: 18.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFeaturedGoalsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 7.h,
        bottom: 10.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "Featured goals",
              style: TextStyle(
                color: appTheme.black900,
                fontSize: 20.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "See All",
              style: TextStyle(
                color: appTheme.blue300,
                fontSize: 20.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDonationComponentList(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: donationC.getDonation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 17.v,
                );
              },
              itemCount: snapshot.data!.size,
              itemBuilder: (
                context,
                index,
              ) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detaildonation);
                  },
                  child: DonationcomponentlistItemWidget(data["judul"],
                      data["status"], data["cover_gambar"], data["type"]),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
