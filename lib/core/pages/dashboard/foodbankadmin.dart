import 'package:NourishBite/widgets/viewhierarchy_item_widget.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
import 'package:NourishBite/widgets/app_bar/custom_app_bar.dart';
import 'package:NourishBite/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class Foodbankadmin extends StatelessWidget {
  const Foodbankadmin({Key? key})
      : super(
          key: key,
        );

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
                child: _buildViewHierarchy(context),
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
          Navigator.pushNamed(context, AppRoutes.dashboard);
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
        text: "Menu Food Bank",
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
            "Food Bank",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          Spacer(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildViewHierarchy(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 21.v,
        );
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return ViewhierarchyItemWidget();
      },
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 88,
      width: 88,
      backgroundColor: const Color.fromARGB(255, 255, 182, 0),
      onTap: () {},
      child: CustomImageView(
        imagePath: ImageConstant.iconplus,
        color: Colors.black,
        height: 26.0.v,
        width: 26.0.h,
      ),
    );
  }
}
