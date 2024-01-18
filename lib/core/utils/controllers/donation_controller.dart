import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DonationController extends GetxController {
  final _fStore = FirebaseFirestore.instance;
  final _fStorage = storage.FirebaseStorage.instance;
  final _imgPicker = ImagePicker();
  XFile? image;
  Stream<QuerySnapshot<Object?>> getDonation() {
    CollectionReference ref = _fStore.collection("donations");
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

  void addProgram(String judul, String overview, String keterangan) async {
    if (judul.isNotEmpty && overview.isNotEmpty && keterangan.isNotEmpty) {
      if (image != null) {
        File file = File(image!.path);
        var fileName = image!.name;
        try {
          await _fStorage.ref("program_image/$fileName").putFile(file);
          String urlImg =
              await _fStorage.ref("program_image/$fileName").getDownloadURL();

          await _fStore.collection("programs").add({
            "judul": judul,
            "detail_donation": {
              "keterangan": keterangan,
              "overview": overview,
            },
            "isEmergency": true,
            "status": "on going",
            "cover_image": urlImg,
            "type": ["Emergency", "Nutrition"]
          });
          print("Berhasil upload");
        } on storage.FirebaseException catch (e) {
          print(e);
        }
      } else {
        print("Gambar tidak ada");
      }
    } else {
      print("$judul , $overview, $keterangan");
    }
  }
}
