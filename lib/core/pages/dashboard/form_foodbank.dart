import 'dart:io';

import 'package:NourishBite/core/utils/controllers/donation_controller.dart';
import 'package:NourishBite/core/utils/controllers/foodbank_controller.dart';
import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class FormFoodBank extends StatelessWidget {
  FormFoodBank({Key? key}) : super(key: key);

  final nameCon = TextEditingController();
  final addressCon = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final foodbankC = Get.find<FoodbankController>();

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
                      "Form Foodbank",
                      style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontSize: 48.fSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 59.v),
                    _buildInput(context, nameCon, "Foodbank Name"),
                    SizedBox(height: 20.v),
                    _buildInput(context, addressCon, "Address"),
                    SizedBox(height: 10.v),
                    _buildBrowseImg(foodbankC: foodbankC),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Pastikan anda berada pada foodbank agar lokasi foodbank tidak keliru",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.v),
                    _buildLoginButton(
                      context,
                      nameCon.text,
                      addressCon.text,
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
  Widget _buildLoginButton(BuildContext context, String judul, String address) {
    return CustomElevatedButton(
      text: "Submit",
      onPressed: () => foodbankC.addProgram(judul, address),
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
    required this.foodbankC,
  }) : super(key: key);

  final FoodbankController foodbankC;

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
              GetBuilder<FoodbankController>(
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
                onPressed: () => foodbankC.uploadFile(),
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
