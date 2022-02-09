import 'package:flutter/material.dart';
import 'package:btb/core/theme/styles.dart';

Widget simpleListTile({
  String? title,
  VoidCallback? goTo,
  Widget? trailWidget,
}) {
  return Card(
    child: ListTile(
      onTap: goTo,
      title: Text(
        title!,
        style: Styles.headlineText2,
      ),
      trailing: trailWidget,
    ),
  );
}
