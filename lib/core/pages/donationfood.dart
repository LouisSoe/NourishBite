import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DonationFood extends StatefulWidget {
  const DonationFood({Key? key}) : super(key: key);
  static const LatLng source = LatLng(-8.190335464998851, 113.6993554828294);
  static const LatLng des = LatLng(-8.188912462228814, 113.70160853844493);

  @override
  State<DonationFood> createState() => _MapsState();
}

class _MapsState extends State<DonationFood> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _mapcon = Completer();

    return Scaffold(
      body: SafeArea(
          child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: DonationFood.source, zoom: 13.5),
        onMapCreated: (GoogleMapController controller) {
          if (!_mapcon.isCompleted) {
            _mapcon.complete(controller);
          }
        },
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: DonationFood.source,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: DonationFood.des,
          ),
        },
      )),
    );
  }
}
