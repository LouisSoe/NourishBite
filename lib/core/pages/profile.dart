import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            selectedIndex: 3,
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
          child: Column(
            children: [
              _buildProfileStack(context),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 298,
                height: 87,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 298,
                        height: 87,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 145,
                      top: 27,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(1.57),
                        child: Container(
                          width: 34,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 47,
                      top: 57,
                      child: Text(
                        'Achivement',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.26,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 163,
                      top: 57,
                      child: Text(
                        'Total Donation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: -0.26,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 69,
                      top: 27,
                      child: Text(
                        '16',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                          letterSpacing: -0.44,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 193,
                      top: 27,
                      child: Text(
                        '12',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                          letterSpacing: -0.44,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 48.h,
                  right: 44.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 47.h,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(top: 15.v),
                //       child: Column(
                //         children: [
                //           Text(
                //             "16",
                //             style: theme.textTheme.titleLarge,
                //           ),
                //           SizedBox(height: 3.v),
                //           Text(
                //             "Achivement",
                //             style: theme.textTheme.labelLarge,
                //           ),
                //         ],
                //       ),
                //     ),
                //     Spacer(),
                //     SizedBox(
                //       height: 59.v,
                //       child: VerticalDivider(
                //         width: 1.h,
                //         thickness: 1.v,
                //         indent: 13.h,
                //         endIndent: 12.h,
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(
                //         left: 17.h,
                //         top: 15.v,
                //         right: 8.h,
                //       ),
                //       child: Column(
                //         children: [
                //           Text(
                //             "12",
                //             style: theme.textTheme.titleLarge,
                //           ),
                //           SizedBox(height: 3.v),
                //           Text(
                //             "Total Donation",
                //             style: theme.textTheme.labelLarge,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 298,
                  height: 39,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 298,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 8,
                        child: Icon(
                          Icons.privacy_tip,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 12,
                        child: Text(
                          'Preference',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 270,
                          top: 8,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 298,
                  height: 39,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 298,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 8,
                        child: Icon(
                          Icons.update,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 12,
                        child: Text(
                          'Donation History',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 270,
                          top: 8,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 298,
                  height: 39,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 298,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 8,
                        child: Icon(
                          Icons.headset_mic,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 12,
                        child: Text(
                          'Help & Support',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 270,
                          top: 8,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 298,
                  height: 39,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 298,
                          height: 39,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 7,
                        top: 8,
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 41,
                        top: 12,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 270,
                          top: 8,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileStack(BuildContext context) {
    return SizedBox(
      height: 299.v,
      width: double.maxFinite,
      child: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 274.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse19,
                      height: 274.v,
                      width: 390.h,
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 45.v),
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 298,
              height: 171,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 53,
                    child: Container(
                      width: 298,
                      height: 118,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 96,
                    top: 0,
                    child: Container(
                      width: 106,
                      height: 106,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgEllipse17,
                              height: 102.adaptSize,
                              width: 102.adaptSize,
                              radius: BorderRadius.circular(
                                51.h,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                          Positioned(
                            left: 71,
                            top: 71,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFB600),
                                shape: OvalBorder(),
                              ),
                              child: CustomIconButton(
                                height: 35.adaptSize,
                                width: 35.adaptSize,
                                padding: EdgeInsets.all(6.h),
                                alignment: Alignment.bottomRight,
                                child: CustomImageView(
                                  imagePath: ImageConstant.iconpencil,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 78,
                            top: 79,
                            child: Container(
                              width: 21,
                              height: 21,
                              padding: const EdgeInsets.only(
                                top: 1.93,
                                left: 1.94,
                                right: 1.93,
                                bottom: 1.93,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // children: [
                                // ,
                                // ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 113,
                    child: Text(
                      'Jacklin Silva',
                      style: TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 84,
                    top: 140,
                    child: Text(
                      'jacklinSilva@gmail.com',
                      style: TextStyle(
                        color: Color(0xFFB1B1B1),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.12,
                        letterSpacing: -0.26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
