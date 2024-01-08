import 'package:flutter/material.dart';
import 'package:NourishBite/core/pages/register.dart';
import 'package:NourishBite/core/app_export.dart';
import 'package:NourishBite/widgets/custom_elevated_button.dart';
import 'package:NourishBite/widgets/custom_outlined_button.dart';
import 'package:NourishBite/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController usertgllahirController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLogin,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
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
                      CustomImageView(
                        imagePath: ImageConstant.imgSubtract,
                        height: 110.v,
                        width: 96.h,
                        color: const Color.fromARGB(255, 255, 182, 0),
                      ),
                      SizedBox(height: 30.v),
                      _buildUserName(context),
                      SizedBox(height: 11.v),
                      _buildUseremail(context),
                      SizedBox(height: 11.v),
                      _buildUsertgllahir(context),
                      SizedBox(height: 11.v),
                      _buildPassword(context),
                      SizedBox(height: 11.v),
                      _buildConfirmPassword(context),
                      SizedBox(height: 32.v),
                      _buildLoginButton(context),
                      SizedBox(height: 15.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 21.h),
                          decoration: AppDecoration.outlineBlack,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: 13.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 93.v),
                      _buildSignupButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: CustomTextFormField(
        controller: userNameController,
        hintText: "Username/Email",
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(11.h, 10.v, 8.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgLock,
            height: 20.adaptSize,
            width: 20.adaptSize,
            color: Colors.white,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
      ),
    );
  }

  Widget _buildUseremail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: CustomTextFormField(
        controller: userEmailController,
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(11.h, 10.v, 8.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgemail,
            height: 20.adaptSize,
            width: 20.adaptSize,
            color: Colors.white,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
      ),
    );
  }

  Widget _buildUsertgllahir(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: CustomTextFormField(
        controller: usertgllahirController,
        hintText: "Tanggal Lahir",
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(11.h, 10.v, 8.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgbirthday,
            height: 20.adaptSize,
            width: 20.adaptSize,
            color: Colors.white,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: CustomTextFormField(
        controller: passwordController,
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(10.h, 10.v, 7.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSettings,
            height: 22.adaptSize,
            width: 22.adaptSize,
            color: Colors.white,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
        obscureText: true,
      ),
    );
  }

  Widget _buildConfirmPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: CustomTextFormField(
        controller: confirmpasswordController,
        hintStyle: TextStyle(color: Colors.white),
        textStyle: TextStyle(color: Colors.white),
        hintText: "Confirm Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(10.h, 10.v, 7.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSettings,
            height: 22.adaptSize,
            width: 22.adaptSize,
            color: Colors.white,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 42.v,
        ),
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Register",
      buttonTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      margin: EdgeInsets.symmetric(horizontal: 15.h),
    );
  }

  /// Section Widget
  Widget _buildSignupButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "Already have an account ? Log In",
      margin: EdgeInsets.only(
        left: 10.h,
        right: 23.h,
      ),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.loginScreen);
      },
    );
  }
}
