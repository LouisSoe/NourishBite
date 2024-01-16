import 'package:NourishBite/widgets/eighteen_item_widget.dart';
import 'package:NourishBite/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
// import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
// import 'package:NourishBite/widgets/app_bar/custom_app_bar.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:NourishBite/widgets/custom_text_form_field.dart';

class DontationMoneyScreen extends StatefulWidget {
  const DontationMoneyScreen({Key? key})
      : super(
          key: key,
        );
  State<DontationMoneyScreen> createState() => Donatemoney();
}

class Donatemoney extends State<DontationMoneyScreen> {
  final List<String> jml_donasi = <String>[
    '1',
    '5',
    '10',
    '50',
  ];
  final List<String> ids = <String>[
    'id-123',
    'id-134',
    'id-145',
    'id-156',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5002,
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 30.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOne(context),
                SizedBox(height: 25.v),
                Text(
                  "Select Amount",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 20.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 14.v),
                _buildEighteen(context),
                SizedBox(height: 24.v),
                _buildLineFive(context),
                SizedBox(height: 7.v),
                CustomTextFormField(
                  autofocus: false,
                  hintText: "Enter Price Manualy",
                  fillColor: Colors.white,
                  alignment: Alignment.center,
                  hintStyle: TextStyle(color: Colors.grey),
                  textStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  textInputType: TextInputType.emailAddress,
                  borderDecoration: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), // Set border color to grey
                  ),
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(11.h, 10.v, 8.h, 10.v),
                    child: CustomImageView(
                      // imagePath: ImageConstant.imgLock,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      color: Colors.grey,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: 42.v,
                  ),
                ),
                SizedBox(height: 34.v),
                Text(
                  "Select payment",
                  style: TextStyle(
                    color: appTheme.black900,
                    fontSize: 20.fSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.v),
                _buildpayment(context),
                SizedBox(height: 24.v),
                _buildPayConfirm(context),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 64.v,
  //     title: AppbarTitle(
  //       text: "X",
  //       margin: EdgeInsets.only(left: 8.h),
  //     ),
  //   );
  // }

  /// Section Widget
  Widget _buildOne(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 52.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.outlineBlack9001,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7.v),
          SizedBox(
            width: 246.h,
            child: Text(
              "with just 1 , you can share meal with someone else.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appTheme.blueGray90001,
                fontSize: 18.fSize,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return Center(
      child: Wrap(
        runSpacing: 20.v,
        spacing: 20.h,
        children: List<Widget>.generate(jml_donasi.length,
            (index) => EighteenItemWidget(jml_donasi[index])),
      ),
    );
    //   return SelectGroupCard(context, titles: titles, ids: ids,
    //       onTap: (title, id) {
    //     debugPrint(title);
    //     debugPrint(id);
    //   });
  }

  /// Section Widget
  Widget _buildLineFive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: SizedBox(
              width: 158.h,
              child: Divider(
                color: appTheme.gray500,
              ),
            ),
          ),
          Text(
            "or",
            style: TextStyle(
              color: appTheme.gray600,
              fontSize: 16.fSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 9.v,
              bottom: 8.v,
            ),
            child: SizedBox(
              width: 158.h,
              child: Divider(
                color: appTheme.gray500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildpayment(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
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
        itemBuilder: (context, index) {
          return paymentwidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPayConfirm(BuildContext context) {
    return SizedBox(
      height: 59.v,
      width: 349.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomElevatedButton(
            width: 349.h,
            buttonTextStyle: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            text: "Pay & Confirm",
            buttonStyle: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 0, 171, 58))),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
