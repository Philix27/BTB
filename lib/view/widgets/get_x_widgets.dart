import 'package:btb/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//? Route/Navigator
goTo(Widget page) {
  return Get.to(
    page,
    transition: Transition.rightToLeft,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeIn,
  );
}

goReplaceAll(Widget page) {
  return Get.offAll(
    page,
    transition: Transition.rightToLeft,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeIn,
  );
}

void getBack() => Get.back();

//? Snackbar
 snackbar({
  required String title,
  String message = '',
  Color? bgColor,
}) {
  return Get.snackbar(
    title,
    message,
    titleText: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 13.5,
        color: Colors.white,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgColor ?? Colors.blue[700],
    borderRadius: 10,
  );
}

errorSnackbar(dynamic title) {
  const String message = '';

  // ignore: void_checks
  return Get.snackbar(
    title.toString(),
    message,
    titleText: Text(
      title.toString(),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    messageText: Text(
      message,
      style: Styles.headlineText4,
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Styles.warningColor,
    borderRadius: 10,
  );
}

//? Alert Dialog
Future<dynamic> alertDialog({
  String? title,
  Widget? content,
  VoidCallback? cancelCallback,
  VoidCallback? confirmCallback,
}) {
  return Get.defaultDialog(
    title: title!,
    titleStyle: Styles.headlineText2,
    content: content,
    backgroundColor: Styles.canvasColor,
    radius: 10,
    textConfirm: 'Confirm',
    textCancel: 'Cancel',
    onCancel: cancelCallback,
    onConfirm: confirmCallback,
    barrierDismissible: false,
  );
}

Future<dynamic> selectAlertDialog({
  required String title,
  required Widget content,
}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: Styles.headlineText1,
    content: content,
    backgroundColor: Styles.canvasColor,
    radius: 10,
    textCancel: 'Cancel',
    onCancel: () {},
    barrierDismissible: false,
  );
}

//? Bottom Bar

Future<dynamic> infoBS(String info) {
  return Get.bottomSheet(
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: Text(
        info,
        style: Styles.bodyText2,
      ),
    ),
    backgroundColor: Styles.canvasColor,
    isDismissible: true,
  );
}

Future<dynamic> bottomSheet(Widget widget) {
  return Get.bottomSheet(
    widget,
    backgroundColor: Styles.canvasColor,
    isDismissible: true,
  );
}
