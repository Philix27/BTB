// import 'package:btb/controller/all_bindings.dart';
// import 'package:btb/controller/payment_controller.dart';
// import 'package:btb/models/payment_card.dart';
// import 'package:btb/services/payment_card/add_card.dart';
// import 'package:btb/core/styles.dart';
// import 'package:btb/view/news/check_out_news.dart';
// import 'package:btb/view/widgets/get_x_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class CardPcikerController extends GetxController {
//   final PaymentController _paymentController = Get.put(PaymentController());

//   Future<void> pickCard(CheckoutNews checkoutNews) async {
//     bottomSheet(
//       Column(
//         children: [
//           Flexible(
//             child: WatchBoxBuilder(
//               box: hiveController.paymentCardBox,
//               builder: (context, paymentCardBox) {
//                 return ListView.builder(
//                   itemCount: hiveController.paymentCardBox.length,
//                   itemBuilder: (context, index) {
//                     if (hiveController.paymentCardBox.isEmpty) {
//                       return ListTile(
//                         title: Text(
//                           'You have no saved card',
//                           style: Styles.headlineText1,
//                         ),
//                         onTap: () {
//                           goTo(const AddPaymentCard());
//                         },
//                       );
//                     } else {
//                       final paymentCard =
//                           paymentCardBox.getAt(index) as PaymentCardModel;

//                       final String cardStart = paymentCard.cardNumber
//                           .substring(0, paymentCard.cardNumber.length - 12);

//                       final String cardEnd = paymentCard.cardNumber
//                           .substring(14, paymentCard.cardNumber.length);

//                       final String cardNum =
//                           "$cardStart* * * * * * * *$cardEnd";

//                       return Wrap(
//                         children: [
//                           ListTile(
//                             title: Text(
//                               paymentCard.bankName,
//                               style: Styles.headlineText2,
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   paymentCard.cardHolderName,
//                                   style: Styles.headlineText2,
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   cardNum,
//                                   style: Styles.headlineText2,
//                                 ),
//                               ],
//                             ),
//                             trailing: Text(
//                               "${paymentCard.expiryMonth}/**",
//                               style: Styles.headlineText2,
//                             ),
//                             onTap: () {
//                               getBack();
//                               _paymentController.startPayment_WithSavedCard(
//                                 context,
//                                 checkoutNews: checkoutNews,
//                                 card: PaymentCard(
//                                   name: paymentCard.cardHolderName,
//                                   number: paymentCard.cardNumber,
//                                   cvc: paymentCard.cvv,
//                                   expiryMonth: paymentCard
//                                       .expiryMonth, //! paymentCard.expiryDate,
//                                   expiryYear: paymentCard.expiryYear,
//                                   //? Required
//                                 ),
//                               );
//                             },
//                           ),
//                           Divider(color: Styles.backgroundColor),
//                         ],
//                       );
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//           Divider(color: Styles.primaryColor),
//           Builder(builder: (context) {
//             return ListTile(
//               title: Text(
//                 'Pay with your card!',
//                 style: Styles.headlineText2,
//               ),
//               trailing: const Icon(Icons.payment),
//               onTap: () {
//                 _paymentController.startPayment_WithOutSavedCard(
//                   context,
//                   checkoutNews: checkoutNews,
//                 );
//               },
//             );
//           }),
//           Divider(color: Styles.primaryColor),
//           ListTile(
//             title: Text(
//               'Click to add card!',
//               style: Styles.headlineText2,
//             ),
//             trailing: const Icon(Icons.add),
//             onTap: () {
//               goTo(const AddPaymentCard());
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
