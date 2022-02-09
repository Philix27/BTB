// import 'package:btb/controller/uploader_controller.dart';
// import 'package:btb/core/global_variables.dart';
// import 'package:btb/core/styles.dart';
// import 'package:btb/view/news/check_out_news.dart';
// import 'package:btb/view/widgets/get_x_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:get/get.dart';

// class PaymentController extends GetxController {
//   final Uploader _uploader = Get.put(Uploader());

//   @override
//   void onInit() {
//     PaystackPlugin.initialize(publicKey: publicKey);
//     super.onInit();
//   }

//   Rx<bool> _isPaymentSuccessful = Rx(false);
//   Rx<bool> get isPaymentSuccessful => _isPaymentSuccessful;

//   final Map<String, dynamic> paymentDetails = {
//     'userName': firebaseCurrentUser.displayName,
//     'userID': firebaseCurrentUser.uid,
//     'email': firebaseCurrentUser.email,
//     'phoneNumber': firebaseCurrentUser.phoneNumber,
//   };

//   // ignore: non_constant_identifier_names
//   Future<void> startPayment_WithSavedCard(
//     BuildContext context, {
//     required CheckoutNews checkoutNews,
//     required PaymentCard card,
//   }) async {
//     paymentDetails.addAll({
//       'paymentPurpose': checkoutNews.paymentPurpose,
//       'amountToPay': checkoutNews.price,
//     });

//     final Charge charge = Charge()
//       ..amount = int.parse("${checkoutNews.price}00")
//       ..card = card
//       ..email = firebaseCurrentUser.email
//       ..putMetaData(firebaseCurrentUser.uid, paymentDetails)
//       ..reference = DateTime.now().toString();

//     final CheckoutResponse response = await PaystackPlugin.checkout(
//       context,
//       method: CheckoutMethod.card,
//       charge: charge,
//     );
//     //? On successfuk Payment
//     if (response.status) {
//       _isPaymentSuccessful.value = true;
//       _uploader.uploadDoc(checkoutNews: checkoutNews);
//     } else {
//       _isPaymentSuccessful.value = false;
//       snackbar(
//         title: 'Failed',
//         message: 'Payment not successful',
//         bgColor: Styles.warningColor,
//       );
//     }
//   }

//   // ignore: non_constant_identifier_names
//   Future<void> startPayment_WithOutSavedCard(
//     BuildContext context, {
//     required CheckoutNews checkoutNews,
//   }) async {
//     paymentDetails.addAll({
//       'paymentPurpose': checkoutNews.paymentPurpose,
//       'amountToPay': checkoutNews.price,
//     });

//     final Charge charge = Charge()
//       ..amount = int.parse("${checkoutNews.price}00")
//       ..email = firebaseCurrentUser.email
//       ..putMetaData(firebaseCurrentUser.uid, paymentDetails)
//       ..reference = DateTime.now().toString();

//     final CheckoutResponse response = await PaystackPlugin.checkout(
//       context,
//       method: CheckoutMethod.card,
//       charge: charge,
//     );
//     //? On successfuk Payment
//     if (response.status) {
//       _isPaymentSuccessful.value = true;
//       _uploader.uploadDoc(checkoutNews: checkoutNews);
//     } else {
//       _isPaymentSuccessful.value = false;
//       snackbar(
//         title: 'Failed',
//         message: 'Payment not successful',
//         bgColor: Styles.warningColor,
//       );
//     }
//   }

//   @override
//   void onClose() {
//     _isPaymentSuccessful = Rx(false);
//   }
// }
