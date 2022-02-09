import 'package:btb/core/theme/styles.dart';
import 'package:flutter/material.dart';

Widget raisedButton({
  VoidCallback? onPressed,
  required String title,
  Color? color,
}) {
  // ignore: deprecated_member_use
  return RaisedButton(
    onPressed: onPressed,
    color: Styles.primaryColor,
    // color: color ?? Styles.primaryColor,
    textColor: Styles.canvasColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: const EdgeInsets.all(16),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: Styles.headlineText4,
      ),
    ),
  );
}
