import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_icon_button.dart';
import 'package:NourishBite/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  TextEditingController icoutlineprivacytipController = TextEditingController();

  TextEditingController solarhistorylinearController = TextEditingController();

  TextEditingController claritylogoutlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildProfileStack(context),
              SizedBox(height: 16.v),
              Container(
                margin: EdgeInsets.only(
                  left: 48.h,
                  right: 44.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 47.h,
                  vertical: 13.v,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.v),
                      child: Column(
                        children: [
                          Text(
                            "16",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            "Achivement",
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 59.v,
                      child: VerticalDivider(
                        width: 1.h,
                        thickness: 1.v,
                        indent: 13.h,
                        endIndent: 12.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 17.h,
                        top: 15.v,
                        right: 8.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 3.v),
                          Text(
                            "Total Donation",
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19.v),
              Container(
                width: 320,
                height: 40,
                color: Colors.grey,
                margin: EdgeInsets.fromLTRB(9.h, 8.v, 11.h, 8.v),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 49.h,
              //     right: 43.h,
              //   ),
              //   child: Container(
              //     margin: EdgeInsets.fromLTRB(9.h, 8.v, 11.h, 8.v),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(
              //         5.h,
              //       ),
              //     ),
              //     child: CustomImageView(
              //       imagePath: ImageConstant.iconprivacy,
              //       height: 23.v,
              //       width: 21.h,
              //     ),
              //   ),
              // ),
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
                      padding: EdgeInsets.only(top: 65.v),
                      child: Text(
                        "My Profile",
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 46.h),
              padding: EdgeInsets.symmetric(
                horizontal: 83.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 45.v),
                  Text(
                    "Jacklin Silva",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 5.v),
                  Text(
                    "jacklinSilva@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 106.adaptSize,
              width: 106.adaptSize,
              margin: EdgeInsets.only(bottom: 65.v),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse17,
                    height: 102.adaptSize,
                    width: 102.adaptSize,
                    radius: BorderRadius.circular(
                      51.h,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  CustomIconButton(
                    height: 35.adaptSize,
                    width: 35.adaptSize,
                    padding: EdgeInsets.all(6.h),
                    alignment: Alignment.bottomRight,
                    child: CustomImageView(
                      imagePath: ImageConstant.iconpencil,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
