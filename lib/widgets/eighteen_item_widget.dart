import 'package:flutter/material.dart';
import 'package:NourishBite/core/app_export.dart';

class EighteenItemWidget extends StatefulWidget {
  final String angka;
  const EighteenItemWidget(this.angka, {Key? key}) : super(key: key);

  @override
  State<EighteenItemWidget> createState() => _EighteenItemWidgetState();
}

class _EighteenItemWidgetState extends State<EighteenItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderAnimation;
  bool _isSelected = false; // Track selection state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _borderAnimation = Tween<double>(begin: 1.0, end: 3.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 35.v),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "1",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 30.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: _isSelected,
      backgroundColor: appTheme.gray5002,
      selectedColor: appTheme.whiteA70002,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.gray40002,
          width: _borderAnimation.value.h,
        ),
      ),
      onSelected: (value) {
        setState(() {
          if (!_isSelected) {
            _isSelected = true;
            _controller.forward();
          } else {
            _controller.reverse(); // Reverse animation before deselecting
          }
        });
      },
    );
  }
}
