import 'package:NourishBite/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewhierarchyItemWidget extends StatelessWidget {
  const ViewhierarchyItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack90001.copyWith(
        color: Colors.white,
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 135.v,
            width: 130.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle30,
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
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.h,
                                    top: 106.v,
                                  ),
                                  child: Text(
                                    "3 days left",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 71.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.h,
                              vertical: 1.v,
                            ),
                            decoration: AppDecoration.fillGreen.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL51,
                            ),
                            child: Text(
                              "Ongoing",
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
          Container(
            width: 155.h,
            margin: EdgeInsets.only(
              left: 13.h,
              top: 6.v,
              bottom: 57.v,
            ),
            child: Text(
              "Nutrition Food distribution in San pedro, Philipine",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                height: 37.adaptSize,
                width: 37.adaptSize,
                margin: EdgeInsets.only(
                  left: 6.h,
                  top: 3.v,
                  bottom: 95.v,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 182, 0),
                  borderRadius: BorderRadius.circular(
                    18.h,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5.5,
                      right: 6,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
