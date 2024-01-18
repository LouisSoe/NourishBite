import 'package:NourishBite/core/utils/controllers/distribution_controller.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
import 'package:NourishBite/widgets/app_bar/custom_app_bar.dart';
import 'package:NourishBite/widgets/custom_floating_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistributionAdminScreen extends StatelessWidget {
  DistributionAdminScreen({Key? key})
      : super(
          key: key,
        );
  final distributionC = Get.find<DistributionController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray50,
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.v),
              _buildThirty(context),
              SizedBox(height: 10.v),
              Expanded(
                child: StreamBuilder<QuerySnapshot<Object?>>(
                  stream: distributionC.getDistribution(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 21.v,
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
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
                                      imagePath: "${data["cover_image"]}",
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
                                                margin:
                                                    EdgeInsets.only(left: 1.h),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 4.h,
                                                  vertical: 5.v,
                                                ),
                                                decoration: AppDecoration
                                                    .gradientBlackToBlack
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .customBorderTL5,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 5.h,
                                                        top: 106.v,
                                                      ),
                                                      child: Text(
                                                        "${data["distribution_date"]}",
                                                        style: theme.textTheme
                                                            .labelLarge,
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
                                                decoration: AppDecoration
                                                    .fillGreen
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .customBorderTL51,
                                                ),
                                                child: Text(
                                                  "${data["status"]}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
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
                                  "${data["program_name"]} \n ${data["address"]}",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
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
                                    color:
                                        const Color.fromARGB(255, 255, 182, 0),
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
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _buildThirtyNine(context),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: CustomImageView(
        onTap: () {
          Get.toNamed(AppRoutes.dashboard);
        },
        color: Colors.white,
        imagePath: ImageConstant.arrowleft,
        margin: EdgeInsets.only(
          left: 8.h,
          top: 7.v,
          bottom: 4.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Menu Distribution",
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildThirty(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 12.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Distribution",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          Spacer(),
        ],
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 88,
      width: 88,
      backgroundColor: const Color.fromARGB(255, 255, 182, 0),
      onTap: () => Get.toNamed(AppRoutes.distributionform),
      child: CustomImageView(
        imagePath: ImageConstant.iconplus,
        color: Colors.black,
        height: 26.0.v,
        width: 26.0.h,
      ),
    );
  }
}
