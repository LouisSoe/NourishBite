import 'package:NourishBite/core/utils/sidebar.dart';
import 'package:NourishBite/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class Program extends StatelessWidget {
  Program({Key? key}) : super(key: key);
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Program"),
      ),
      drawer: Sidebar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 120,
          //   color: Colors.red,
          //   child: Row(children: [
          //     Container(
          //       width: 120,
          //       height: double.maxFinite,
          //       color: Colors.black,
          //     ),
          //     Column(
          //       children: [
          //         Text("data")
          //       ],
          //     )
          //   ],

          //   ),
          // )
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.red,
            child: Column(
              children: [
                Text("Title"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("Check Location");
          // Position pos = await determinePosition();
          // print("${pos.latitude}, ${pos.longitude}");
          Get.toNamed(AppRoutes.formfoodbank);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
