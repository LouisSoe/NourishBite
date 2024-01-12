import 'package:cloud_firestore/cloud_firestore.dart';

class DonationController {
  final _fStore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>> getDonation() {
    CollectionReference ref = _fStore.collection("donations");
    return ref.snapshots();
  }
  Stream<QuerySnapshot<Object?>> getLongTermDonation() {
    return _fStore.collection("donations").where("type", arrayContains: "Long-term Crisis").snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getEmergency() {
    return _fStore
        .collection("donations")
        .where("isEmergency", isEqualTo: true)
        .limit(1)
        .get();
  }
}
