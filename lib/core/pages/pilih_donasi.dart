import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';

class DontationStageScreen extends StatelessWidget {
  const DontationStageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blueGray800,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 128.v),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildDonationStage(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDonationStage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 314.v),
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Container(
            width: 287.h,
            margin: EdgeInsets.only(
              left: 30.h,
              right: 32.h,
            ),
            child: Text(
              "Choose Type \nof donation",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appTheme.gray5003,
                fontSize: 45.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 111.v),
          CustomElevatedButton(
            buttonTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            text: "Food",
            leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.h,
                ),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse2851x51,
                height: 51.adaptSize,
                width: 51.adaptSize,
              ),
            ),
            buttonStyle: CustomButtonStyles.fillGreenA,
          ),
          SizedBox(height: 22.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 13.v,
                  bottom: 15.v,
                ),
                child: SizedBox(
                  width: 154.h,
                  child: Divider(),
                ),
              ),
              Text(
                "or",
                style: TextStyle(
                  color: appTheme.blueGray100,
                  fontSize: 24.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.v,
                  bottom: 14.v,
                ),
                child: SizedBox(
                  width: 154.h,
                  child: Divider(),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.v),
          CustomElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.donationmoney),
            text: "Money",
            buttonTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.h,
                ),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse2951x51,
                height: 51.adaptSize,
                width: 51.adaptSize,
              ),
            ),
            buttonStyle: CustomButtonStyles.fillGreenA,
          ),
          SizedBox(height: 22.v),
          CustomElevatedButton(
            text: "Back",
            onPressed: () => Navigator.pushNamed(context, AppRoutes.donation),
            buttonTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.h,
                ),
              ),
              child: Icon(
                Icons.arrow_back, // Replace with your desired Material icon
                color: Colors.black, // Optional: Set a specific color
              ),
            ),
            buttonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              // Add other customizations as needed
            ),
          ),
        ],
      ),
    );
  }
}
