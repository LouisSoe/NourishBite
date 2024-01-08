import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
}

class BorderRadiusStyle {}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
