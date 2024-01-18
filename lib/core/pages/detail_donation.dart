import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
// import 'package:NourishBite/widgets/app_bar/appbar_trailing_image.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';

class DetailDonasi extends StatefulWidget {
  const DetailDonasi({Key? key})
      : super(
          key: key,
        );
  @override
  State<DetailDonasi> createState() => screenDetailDonasi();
}

class screenDetailDonasi extends State<DetailDonasi> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildMainStack(context),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 12.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 22.v,
                            width: 81.h,
                            margin: EdgeInsets.only(left: 4.h),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 30.v,
                                    width: 90.h,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(
                                        5.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Emergency",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 22.v,
                            width: 81.h,
                            margin: EdgeInsets.only(left: 4.h),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 22.v,
                                    width: 81.h,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(
                                        5.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Nutrition",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.v),
                      Text(
                        "Meals been Shared",
                        style: CustomTextStyles.titleMediumGray800,
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        "2,402,290",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 8.v),
                      Text(
                        "Overview",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.v),
                      Container(
                        width: 339.h,
                        margin: EdgeInsets.only(right: 10.h),
                        child: Text(
                          "Shared meals will help provide food baskets, cash transfers, children meals and nutrition support in Germany.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 46, 44, 44)),
                        ),
                      ),
                      SizedBox(height: 6.v),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: ConstrainedBox(
                          constraints: expanded
                              ? BoxConstraints()
                              : BoxConstraints(
                                  maxHeight:
                                      12 * 7), // Adjust maxHeight as needed
                          child: Text(
                            "In Germany, despite being a developed nation, hunger remains a challenge, especially among vulnerable groups like low-income families and refugees due to economic disparities. Government initiatives and nonprofits are actively working to address food insecurity by ensuring access to nutritious diets. Mobile technology plays a vital role in connecting those in need with essential resources, fostering a community-driven approach. Stay tuned for updates and opportunities to contribute as we work towards a more inclusive and nourished society in Germany.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 96, 96, 96),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => expanded = !expanded),
                        child: Text(
                          expanded ? "Show Less" : "Show More",
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 158, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildDonateButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainStack(BuildContext context) {
    return SizedBox(
      height: 294.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle36,
            height: 294.v,
            width: 390.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF234A40)),
                        ),
                      ),
                      child: CloseButton(
                        color: Colors.black, // CloseButton color
                      ),
                    ),
                  ),
                  SizedBox(height: 120.v),
                  Container(
                    width: 230.h,
                    margin: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "Help families in Germany",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
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

  /// Section Widget
  Widget _buildDonateButton(BuildContext context) {
    return CustomElevatedButton(
      buttonTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      text: "Donate now",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 21.h,
        bottom: 31.v,
      ),
    );
  }
}
