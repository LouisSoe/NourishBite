import 'emergencychip1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

// ignore: must_be_immutable
class DonationcomponentlistItemWidget extends StatelessWidget {
  final String judul;
  final String status;
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
                  height: 170.v,
                  width: 142.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(5.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 79.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.fillGreen.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL51,
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: appTheme.whiteA70002,
                        fontSize: 10.fSize,
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
                SizedBox(height: 4.v),
                Wrap(
                  runSpacing: 3.v,
                  spacing: 3.h,
                  children: List<Widget>.generate(
                    type.length,
                    (index) => Emergencychip1ItemWidget(
                      type[index],
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                Row(
                  children: [
                    SizedBox(
                      height: 17.v,
                      width: 44.h,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse28,
                            height: 17.adaptSize,
                            width: 17.adaptSize,
                            radius: BorderRadius.circular(
                              8.h,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse29,
                            height: 17.adaptSize,
                            width: 17.adaptSize,
                            radius: BorderRadius.circular(
                              8.h,
                            ),
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 9.h),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse30,
                            height: 17.adaptSize,
                            width: 17.adaptSize,
                            radius: BorderRadius.circular(
                              8.h,
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 9.h),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse31,
                            height: 17.adaptSize,
                            width: 17.adaptSize,
                            radius: BorderRadius.circular(
                              8.h,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                        top: 2.v,
                      ),
                      child: Text(
                        "45,000",
                        style: TextStyle(
                          color: appTheme.gray60002,
                          fontSize: 11.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 2.h,
                        top: 2.v,
                      ),
                      child: Text(
                        "donated",
                        style: TextStyle(
                          color: appTheme.gray60002,
                          fontSize: 11.fSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.v),
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
