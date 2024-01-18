import 'dart:async';
import 'package:NourishBite/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
import 'package:NourishBite/widgets/app_bar/custom_map_bar.dart';

bool isSwipeUp = false;

class Nearestdistribution extends StatefulWidget {
  const Nearestdistribution({Key? key}) : super(key: key);
  static const LatLng source = LatLng(-8.190335464998851, 113.6993554828294);
  static const LatLng des = LatLng(-8.188912462228814, 113.70160853844493);

  @override
  State<Nearestdistribution> createState() => _NearestState();
}

class _NearestState extends State<Nearestdistribution> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Completer<GoogleMapController> _mapcon = Completer();
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > -100) {
            setState(() {
              isSwipeUp = true;
            });
          } else {
            setState(() {
              isSwipeUp = false;
            });
          }
        },
        child: Scaffold(
          body: Container(
            color: Colors.black26,
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: Nearestdistribution.source, zoom: 13.5),
                  onMapCreated: (GoogleMapController controller) {
                    if (!_mapcon.isCompleted) {
                      _mapcon.complete(controller);
                    }
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId("destination"),
                      position: Nearestdistribution.des,
                    ),
                  },
                ),
                AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 400),
                  top: !isSwipeUp ? size.height * 0.6 : size.height * 0.5,
                  child: GestureDetector(
                    onPanEnd: (details) {
                      if (details.velocity.pixelsPerSecond.dy < -100) {
                        setState(() {
                          isSwipeUp = true;
                        });
                      } else {
                        setState(() {
                          isSwipeUp = false;
                        });
                      }
                    },
                    child: CustomBottomSheet(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomMapBar(
      leadingWidth: 45.h,
      leading: CustomImageView(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.distribution);
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
        text: "Distribution",
      ),
      styleType: Style.bgFill,
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.5,
          width: size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Align(
            alignment: Alignment.topCenter,
            child: (isSwipeUp)
                ? const Icon(
                    Icons.expand_less_outlined,
                    size: 30,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.expand_more_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
          ),
        ),
        Positioned(
          top: 45,
          left: 35,
          child: Text(
            "Nearest Distribution",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Positioned(
          top: 85,
          left: 30,
          child: SizedBox(
            height: size.height * 0.5 - 40,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: AppDecoration.outlineBlack900.copyWith(
                      color: Colors.white,
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    width: 320.v,
                    height: 140.v,
                    child: Row(
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
                                              "Nutrition Food distribution in San pedro",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 63),
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      child: Row(
                                        children: [
                                          Text("See details",
                                              style: TextStyle(
                                                  color: Colors.grey)),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
