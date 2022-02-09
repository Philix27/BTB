// import 'package:flutter/foundation.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'package:btb/core/theme/styles.dart';

// import 'package:btb/view/widgets/widgets.dart';

// Future<void> launchURL({
//   required String sendTo,
//   required String code,
// }) async {
//   if (await canLaunch("tel:$code")) {
//     await launch("$code:$sendTo");
//   } else {
//     MyWidgets.snackbar(
//       title: 'Error',
//       message: 'Could not launch tel:$code',
//       bgColor: Styles.warningColor,
//     );
//   }
// }
