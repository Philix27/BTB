import 'package:btb/core/theme/styles.dart';
import 'package:flutter/material.dart';

Widget detailsRow({
  required String title,
  required bool isEmpty,
  IconData? icon,
  VoidCallback? onPressed,
}) {
  if (!isEmpty) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(title, style: Styles.bodyText2),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(icon, color: Styles.primaryColor),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
        Divider(
          color: Styles.backgroundColor,
          thickness: 2.0,
        ),
      ],
    );
  } else {
    return Container();
  }
}
