// import 'package:btb/core/styles.dart';
// import 'package:btb/view/auth/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:btb/view/widgets/loading.dart';

// class SignInPage extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Styles.color,
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/icon/lu.png"),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               Colors.black38,
//               BlendMode.darken,
//             ),
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Spacer(),
//                 const Spacer(),
//                 Obx(() {
//                   return Get.find<AuthController>().isSigningIn.value
//                       ? Loading.spinKitThreeBounce(color: Colors.white)
//                       : RaisedButton(
//                           onPressed: () {
//                             controller.login();
//                           },
//                           color: Colors.white,
//                           textColor: Colors.blue[700],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           padding: const EdgeInsets.all(16),
//                           child: const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Text(
//                               'Sign in with Google',
//                               style: TextStyle(
//                                 color: Styles.color,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         );
//                 }),
//                 const Spacer(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
