import 'dart:io';

import 'package:NourishBite/core/utils/controllers/distribution_controller.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class FormProgram extends StatelessWidget {
  FormProgram({Key? key}) : super(key: key);

  final judulCon = TextEditingController();
  final addressCon = TextEditingController();
  final dateCon = TextEditingController();
  final overviewCon = TextEditingController();
  final keteranganCon = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final distributionC = Get.find<DistributionController>();
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 52.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 61.v),
                    Text(
                      "Form Distribution",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontSize: 50.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 59.v),
                    _buildInput(context, judulCon, "Distribution Name"),
                    SizedBox(height: 11.v),
                    _buildInput(context, addressCon, "Address"),
                    SizedBox(height: 11.v),
                    _buildInput(context, dateCon, "Distribution Date"),
                    SizedBox(height: 11.v),
                    _buildInput(context, overviewCon, "Overview"),
                    SizedBox(height: 11.v),
                    _buildInput(context, keteranganCon, "Keterangan"),
                    _buildBrowseImg(distributionC: distributionC),
                    SizedBox(height: 32.v),
                    _buildLoginButton(
                      context,
                      judulCon.text,
                      addressCon.text,
                      overviewCon.text,
                      keteranganCon.text,
                      dateCon.text,
                    ),
                    SizedBox(height: 15.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildInput(BuildContext context, TextEditingController con, String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: TextFormField(
        controller: con,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          hintStyle: TextStyle(color: Colors.white),
          fillColor: PrimaryColors().green800,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context, String judul, String address,
      String overview, String keterangan, String date) {
    return CustomElevatedButton(
      text: "Submit",
      onPressed: () => distributionC.addProgram(
        judul,
        address,
        overview,
        keterangan,
        date,
      ),
      buttonTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      margin: EdgeInsets.symmetric(horizontal: 15.h),
    );
  }

  /// Section Widget
}

class _buildBrowseImg extends StatelessWidget {
  const _buildBrowseImg({
    Key? key,
    required this.distributionC,
  }) : super(key: key);

  final DistributionController distributionC;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foto Program",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<DistributionController>(
                builder: (c) {
                  if (c.image != null) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: Image.file(
                        File(c.image!.path),
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Text(
                      "No Choosed File",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    );
                  }
                },
              ),
              TextButton(
                onPressed: () => distributionC.uploadFile(),
                child: Text(
                  "Browse",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
