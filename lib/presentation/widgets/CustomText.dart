import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    required this.title,
    required this.family,
    required this.fontColor,
    required this.fontSize,
  });
  String title;
  final String family;
  final double fontSize;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontFamily: family, fontSize: fontSize, color: fontColor),
    );
  }
}
