import 'dart:async';
import 'package:NourishBite/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:NourishBite/widgets/app_bar/appbar_title.dart';
import 'package:NourishBite/widgets/app_bar/custom_map_bar.dart';

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
    final Completer<GoogleMapController> _mapcon = Completer();

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
          child: Container(
              child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: Nearestdistribution.source, zoom: 13.5),
        onMapCreated: (GoogleMapController controller) {
          if (!_mapcon.isCompleted) {
            _mapcon.complete(controller);
          }
        },
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: Nearestdistribution.source,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: Nearestdistribution.des,
          ),
        },
      ))),
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
      // title: ,
    );
  }
}
