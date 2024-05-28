import 'package:flutter/material.dart';

class MySnackbar {
  static SnackBar mySnackbar(final String text) {
    return SnackBar(
      content: Text(
        text,
        style: TextStyle(
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
