import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DistributionController extends GetxController {
  final _fStore = FirebaseFirestore.instance;
  final _fStorage = storage.FirebaseStorage.instance;
  final _imgPicker = ImagePicker();
  XFile? image;
  Stream<QuerySnapshot<Object?>> getDistribution() {
    CollectionReference ref = _fStore.collection("programs");
    return ref.snapshots();
  }

  Stream<QuerySnapshot<Object?>> getLongTermDonation() {
    return _fStore
        .collection("donations")
        .where("type", arrayContains: "Long-term Crisis")
        .snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getEmergency() {
    return _fStore
        .collection("donations")
        .where("isEmergency", isEqualTo: true)
        .limit(1)
        .get();
  }

  void uploadFile() async {
    image = await _imgPicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.name);
      print(image!.path);
    }
    update();
  }

  void addProgram(String judul, String address,String overview,String keterangan, String distribute_date) async {
    if (judul.isNotEmpty && address.isNotEmpty) {
      if (image != null) {
        File file = File(image!.path);
        var fileName = image!.name;
        Position pos = await determinePosition();
        print(pos.latitude);
        try {
          await _fStorage.ref("program_image/$fileName").putFile(file);
          String urlImg =
              await _fStorage.ref("program_image/$fileName").getDownloadURL();

          await _fStore.collection("programs").add({
            "program_name": judul,
            "address": address,
            "position": {
              "lat": pos.latitude,
              "long": pos.longitude,
            },
             "detail_donation": {
              "keterangan": keterangan,
              "overview": overview,
            },
            "distribute_date": distribute_date,
            "status": "Ongoing",
            "cover_image": urlImg,
          });
          image = null;
          Get.defaultDialog(
            title: "Berhasil Submit",
            middleText: "Berhasil memasukan data Distrbusi",
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          );
        } on storage.FirebaseException catch (e) {
          print(e);
        }
      } else {
        print("Gambar tidak ada");
      }
    } else {
      print("Harus diisi secara lengkap");
    }
  }

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
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
