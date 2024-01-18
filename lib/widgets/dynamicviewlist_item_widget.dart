import 'package:NourishBite/core/app_export.dart';
// import 'package:NourishBite/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DynamicviewlistItemWidget extends StatelessWidget {
  final String program_name;
  final String address;
  final String status;
  final String imgPath;
  final String distribute_date;
  
  const DynamicviewlistItemWidget(this.program_name,
  this.address, this.status, this.imgPath, this.distribute_date,
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
        children: [
          SizedBox(
            height: 135.v,
            width: 130.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: imgPath,
                  height: 135.v,
                  width: 130.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(5.h),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 135.v,
                    width: 130.h,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(left: 1.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.h,
                              vertical: 5.v,
                            ),
                            decoration:
                                AppDecoration.gradientBlackToBlack.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL5,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // CustomImageView(
                                //   imagePath: ImageConstant.imgCarbonTime,
                                //   height: 16.adaptSize,
                                //   width: 16.adaptSize,
                                //   margin: EdgeInsets.only(
                                //     top: 106.v,
                                //     bottom: 1.v,
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.h,
                                    top: 106.v,
                                  ),
                                  child: Text(
                                    distribute_date,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 76.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 1.v,
                            ),
                            decoration: AppDecoration.fillGreen.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL51,
                            ),
                            child: Text(
                              status,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              right: 7.h,
              bottom: 7.v,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90.v,
                      width: 155.h,
                      margin: EdgeInsets.only(top: 2.v),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: 155.h,
                              child: Text(
                                program_name + "\n" + address,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                          ),
                          // CustomRatingBar(
                          //   alignment: Alignment.bottomLeft,
                          //   ignoreGestures: true,
                          //   initialRating: 0,
                          // ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMaterialSymbolsShare,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(
                        left: 15.h,
                        bottom: 69.v,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.v),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.only(left: 63),
                        // mainAxisAlignment: MainAxisAlignment.end,
                        child: Row(
                          children: [
                            Text("See details",
                                style: TextStyle(color: Colors.grey)),
                            CustomImageView(
                              imagePath: ImageConstant.arrowright,
                              color: Colors.grey,
                              margin: EdgeInsets.only(
                                left: 9.h,
                                top: 7.v,
                                bottom: 5.v,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
