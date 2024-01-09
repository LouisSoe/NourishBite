import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);
  static const LatLng source = LatLng(-8.190335464998851, 113.6993554828294);
  static const LatLng des = LatLng(-8.188912462228814, 113.70160853844493);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _mapcon = Completer();

    return Scaffold(
      body: SafeArea(
          child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: Maps.source, zoom: 13.5),
        onMapCreated: (GoogleMapController controller) {
          if (!_mapcon.isCompleted) {
            _mapcon.complete(controller);
          }
        },
        markers: {
          Marker(
            markerId: MarkerId("source"),
            position: Maps.source,
          ),
          Marker(
            markerId: MarkerId("destination"),
            position: Maps.des,
          ),
        },
      )),
    );
  }
}
