import 'dart:ui';
import 'package:NourishBite/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
  static ButtonStyle get fillGreenA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.greenA70001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );
  static ButtonStyle get fillOnError => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
      );
}
