import 'package:NourishBite/widgets/emergencylist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_text_form_field.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:NourishBite/widgets/donationcomponentlist_item_widget.dart';

class DonateScreen extends StatelessWidget {
  DonateScreen({Key? key})
      : super(
          key: key,
        );
  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Scaffold(
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
              selectedIndex: 1,
              onTabChange: (index) {
                switch (index) {
                  case 0:
                    // Navigate to Home route
                    Navigator.pushNamed(context, AppRoutes.homePage);
                    break;
                  case 1:
                    // Navigate to Donate route
                    Navigator.pushNamed(context, AppRoutes.donation);
                    break;
                }
              }),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 16.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text(
                            "Choose where to donate",
                            style: TextStyle(
                              color: appTheme.blueGray90002,
                              fontSize: 25.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.v),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 21.h),
                            child: CustomTextFormField(
                              autofocus: false,
                              fillColor: Colors.white,
                              borderDecoration: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey), // Customize border color
                              ),
                              controller: searchController,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey),
                              textStyle: TextStyle(color: Colors.grey),
                              textInputType: TextInputType.emailAddress,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      11.h, 10.v, 8.h, 10.v),
                                  child: Icon(
                                    Icons.search,
                                    size: 25.adaptSize,
                                    color: Colors.grey,
                                  )),
                              prefixConstraints: BoxConstraints(
                                maxHeight: 42.v,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.v),
                        _buildChooseWhereToStack(context),
                        SizedBox(height: 11.v),
                        Container(
                          height: 25.v,
                          width: 129.h,
                          margin: EdgeInsets.only(left: 23.h),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Hunger Crisis",
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 20.fSize,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40.v,
                          width: 307.h,
                          margin: EdgeInsets.only(left: 23.h),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 307.h,
                                  child: Text(
                                    "Some of the world's most significant crises \nthat we address on a long-term basis.",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: appTheme.gray60001,
                                      fontSize: 15.fSize,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.v),
                        _buildEmergencyList(context),
                        Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Text(
                            "Need some love",
                            style: TextStyle(
                              color: appTheme.black900,
                              fontSize: 20.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.v),
                        Container(
                          width: 281.h,
                          margin: EdgeInsets.only(
                            left: 21.h,
                            right: 88.h,
                          ),
                          child: Text(
                            "Food donation goals with low progress,assist and help them some support!",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: appTheme.gray60001,
                              fontSize: 15.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.v),
                        _buildDonationComponentList(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChooseWhereToStack(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 150.v,
        width: 348.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle36,
              height: 150.v,
              width: 348.h,
              radius: BorderRadius.circular(
                5.h,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 348.h,
                decoration: AppDecoration.gradientBlackToBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 88.h,
                      padding: EdgeInsets.all(0),
                      decoration: AppDecoration.fillRed.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL5,
                      ),
                      child: Text(
                        "Emergency",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 42.v),
                    Container(
                      width: 247.h,
                      margin: EdgeInsets.only(left: 11.h),
                      child: Text(
                        "Give emergency aid in Ukraine",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 11.v),
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
  Widget _buildEmergencyList(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        child: SizedBox(
          height: 350.h,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 23.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 15.h,
              );
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return EmergencylistItemWidget("test");
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDonationComponentList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h, left: 20.h, bottom: 100.h),
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
        itemCount: 2,
        itemBuilder: (
          context,
          index,
        ) {
          //parameter judul sisanya tambahin sendiri itu cuman contoh
          return DonationcomponentlistItemWidget("test");
        },
      ),
    );
  }
}
