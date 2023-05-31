import 'package:contact_management/utility/SizeConfig.dart';
import 'package:flutter/material.dart';

returnSnackBar(String title) {
  return SnackBar(
    content: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: getDPSize(5),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
