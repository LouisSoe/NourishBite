import 'package:NourishBite/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _fAuth = FirebaseAuth.instance;
  final _fStore = FirebaseFirestore.instance;

  Stream<User?> get authStatus => _fAuth.authStateChanges();

  void signIn(String email, String password) async {
    try {
      await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.defaultDialog(
        title: "Berhasil Login",
        middleText: "Selamat Datang",
      );
      Get.offAllNamed(AppRoutes.homePage);
      // return credential;
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Auth Error", middleText: "${e.message}");
    }
  }

  signUp(String username, String email, String tgl_lahir, String password,
      String confirmPass) async {
    if (password == confirmPass) {
      try {
        UserCredential credential = await _fAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        _fStore.collection("users").doc(credential.user!.uid).set({
          'uid': credential.user!.uid,
          'username': username,
          'email': email,
          'tgl_lahir': tgl_lahir,
        });
        Get.offAllNamed(AppRoutes.homePage);

        // return credential;
      } on FirebaseAuthException catch (e) {
        Get.defaultDialog(title: "Auth Error", middleText: "${e.message}");
      }
    } else {
      Get.defaultDialog(
          title: "Auth Error", middleText: "Konfirmasi Password salah!");
    }
  }

  void signOut() async {
    await _fAuth.signOut();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void resetPassword(String email) async {
    try {
      await _fAuth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
          title: "Auth Error",
          middleText:
              "${"Berhasil mengirim reset password ke email: ${email}"}");
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Auth Error", middleText: "${e.message}");
    }
  }
}
