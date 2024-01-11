import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

// ignore: must_be_immutable
class paymentwidget extends StatelessWidget {
  const paymentwidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
            padding: EdgeInsets.all(6.h),
            decoration: AppDecoration.fillGreenA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder12,
            ),
            child: Container(
              height: 12.adaptSize,
              width: 12.adaptSize,
              decoration: BoxDecoration(
                color: appTheme.whiteA70001,
                borderRadius: BorderRadius.circular(
                  6.h,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22.h,
              top: 3.v,
            ),
            child: Text(
              "Paypal",
              style: TextStyle(
                color: appTheme.black900,
                fontSize: 20.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.paypallogo,
            height: 26.v,
            width: 91.h,
            margin: EdgeInsets.only(
              top: 2.v,
              right: 4.h,
            ),
          ),
        ],
      ),
    );
  }
}
