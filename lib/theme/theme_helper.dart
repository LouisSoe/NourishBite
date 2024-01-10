import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 3.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displayMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 50.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w300,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFB600),
    primaryContainer: Color(0XFF234A40),
    secondaryContainer: Color(0XFFE0E0E0),

    // On colors(text colors)
    onPrimary: Color(0XFF163020),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
  // Amber
  Color get amber600 => Color(0XFFFFB600);
  Color get amber700 => Color(0XFFDD9E00);
  Color get amber70001 => Color(0XFFDE9E00);

  // Blue
  Color get blue300 => Color(0XFF5DBCFF);
  Color get blue500 => Color(0XFF239EFF);

  // BlueGray
  Color get blueGray100 => Color(0XFFD3D3D3);
  Color get blueGray800 => Color(0XFF234A40);
  Color get blueGray900 => Color(0XFF2E2B2B);
  Color get blueGray90001 => Color(0XFF342A2A);
  Color get blueGray90002 => Color(0XFF322E2E);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFE2E2E2);
  Color get gray400 => Color(0XFFB1B1B1);
  Color get gray40001 => Color(0XFFB6B6B6);
  Color get gray40002 => Color(0XFFB5B5B5);
  Color get gray40003 => Color(0XFFC7C2C2);
  Color get gray40004 => Color(0XFFC0BFC0);
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray500 => Color(0XFF9B9999);
  Color get gray5001 => Color(0XFFFAFAFA);
  Color get gray5002 => Color(0XFFFCFCFC);
  Color get gray5003 => Color(0XFFFFFBF3);
  Color get gray600 => Color(0XFF787878);
  Color get gray60001 => Color(0XFF7B7979);
  Color get gray60002 => Color(0XFF838383);
  Color get gray800 => Color(0XFF494949);
  Color get gray80001 => Color(0XFF4F4F4F);

  // Green
  Color get green800 => Color(0XFF2C6442);
  Color get greenA700 => Color(0XFF00AC3F);
  Color get greenA70001 => Color(0XFF00B470);

  // Red
  Color get red600 => Color(0XFFE93535);

  // White
  Color get whiteA700 => Color(0XFFFFFCFC);
  Color get whiteA70001 => Color(0XFFFDFDFD);
  Color get whiteA70002 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
