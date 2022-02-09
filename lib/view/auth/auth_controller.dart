// import 'package:btb/controller/user_controller.dart';
// import 'package:btb/core/styles.dart';
// // import 'package:btb/core/theme_services.dart';
// // import 'package:btb/core/theme_services.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// // import 'package:btb/view/auth/sign_in_page.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:btb/view/widgets/widgets.dart';

// class AuthController extends GetxController {
//   final UserController _userController = Get.put(UserController());

//   final googleSignIn = GoogleSignIn();
//   Rx<bool> isSigningIn = Rx(false);
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final Rx<User> firebaseUser = Rx<User>();
//   String get user => firebaseUser.value.email!;

//   @override
//   void onInit() {
//     super.onInit();
//     firebaseUser.bindStream(auth.authStateChanges());
//   }

//   Future<void> login() async {
//     isSigningIn = Rx(true);

//     GoogleSignInAccount user;
//     try {
//       user = (await googleSignIn.signIn())!;
//     } on PlatformException {
//       isSigningIn.value = false;

//       isSigningIn.value = false;

//       MyWidgets.snackbar(
//         title: "Opps, an error occured",
//         message: "Check your connection and try again",
//         bgColor: Styles.warningColor,
//       );
//     } catch (error) {
//       MyWidgets.errorSnackbar(error);
//     }

//     if (!user == null) {
//       isSigningIn = Rx(false);
//       return;
//     } else {
//       final googleAuth = await user.authentication;
//       try {
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         await FirebaseAuth.instance
//             .signInWithCredential(credential)
//             .then((value) async {
//           if (value.additionalUserInfo.isNewUser) {
//             _userController.firstRegisterUser('');
//           }
//         });
//       } catch (e) {
//         MyWidgets.errorSnackbar(e);
//       }

//       isSigningIn = Rx(false);
//     }
//   }

//   Future<void> logOut() async {
//     await googleSignIn.disconnect();
//     // ThemeService().makeLight();
//     FirebaseAuth.instance.signOut();
//     // MyWidgets.goReplaceAll(SignInPage());
//   }
// }
