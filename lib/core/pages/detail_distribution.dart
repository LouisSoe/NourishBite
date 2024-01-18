import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
// import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
// // import 'package:NourishBite/widgets/app_bar/appbar_trailing_image.dart';
// import 'package:NourishBite/widgets/app_bar/custom_app_bar.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DetailDistribution extends StatefulWidget {
  const DetailDistribution({Key? key})
      : super(
          key: key,
        );
  static const LatLng source = LatLng(-8.190335464998851, 113.6993554828294);
  static const LatLng des = LatLng(-8.188912462228814, 113.70160853844493);
  @override
  State<DetailDistribution> createState() => screenDetailDistribution();
}

final Map<String, dynamic> data = Get.arguments;
double lat = data["position"]["lat"];
double long = data["position"]["long"];
final destination = LatLng(lat, long);

class screenDetailDistribution extends State<DetailDistribution> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _mapcon = Completer();
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
                          "${data["detail_donation"]["overview"]}",
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
                            "${data["detail_donation"]["tentang"]}",
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
                Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 150,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        CameraPosition(target: destination, zoom: 13.5),
                    onMapCreated: (GoogleMapController controller) {
                      if (!_mapcon.isCompleted) {
                        _mapcon.complete(controller);
                      }
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId("destination"),
                        position: destination,
                      ),
                    },
                  ),
                ),
                SizedBox(height: 20.v),
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
            imagePath: data["cover_image"],
            fit: BoxFit.cover,
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
                  SizedBox(height: 90.v),
                  Container(
                    width: 230.h,
                    margin: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "${data["program_name"]}",
                      maxLines: 4,
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
      text: "See On Map",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 21.h,
        bottom: 31.v,
      ),
    );
  }
}
