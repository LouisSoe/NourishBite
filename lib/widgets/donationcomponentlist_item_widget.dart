import 'emergencychip1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

// ignore: must_be_immutable
class DonationcomponentlistItemWidget extends StatelessWidget {
  final String judul;
  final bool status;
  final String image_cover;
  final List<dynamic> type;
  const DonationcomponentlistItemWidget(
      this.judul, this.status, this.image_cover, this.type,
      {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160.v,
            width: 142.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                CustomImageView(
                  fit: BoxFit.cover,
                  imagePath: image_cover,
                  height: 160.v,
                  width: 142.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(5.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 79.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 1.0,
                    ),
                    decoration: AppDecoration.fillGreen.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL51,
                    ),
                    child: Text(
                      (status) ? "Donate now" : "Emergency",
                      style: TextStyle(
                        color: appTheme.whiteA70002,
                        fontSize: 10.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              top: 2.0,
              right: 8.h,
              bottom: 18.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 145.h,
                      child: Text(
                        judul,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: appTheme.black900,
                          fontSize: 15.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMaterialSymbolsShare,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(
                        left: 21.h,
                        top: 10.v,
                        bottom: 19.v,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 2.v),
                Wrap(
                  runSpacing: 3.v,
                  spacing: 3.h,
                  children: List<Widget>.generate(
                    2,
                    (index) => Emergencychip1ItemWidget(
                      type[index],
                    ),
                  ),
                ),
                Text(
                  "Meals been Shared",
                  style: TextStyle(
                    color: appTheme.gray60002,
                    fontSize: 11.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.v),
                Text(
                  "2,402,290",
                  style: TextStyle(
                    color: appTheme.blueGray900,
                    fontSize: 11.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
