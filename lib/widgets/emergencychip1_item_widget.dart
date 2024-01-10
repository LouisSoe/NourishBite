import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

// ignore: must_be_immutable
class Emergencychip1ItemWidget extends StatelessWidget {
  final String kategory;
  const Emergencychip1ItemWidget(this.kategory, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 1.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        kategory,
        style: TextStyle(
          color: appTheme.whiteA70002,
          fontSize: 11.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.primaryContainer,
      selectedColor: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          5.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
