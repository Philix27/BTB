// import 'package:btb/models/news.dart';
// import 'package:btb/models/payment_card.dart';
// import 'package:btb/core/styles.dart';
// import 'package:btb/view/widgets/get_x_widgets.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';

// class HiveController extends GetxController {
//   Box bookmarkBox = Hive.box('Bookmarks');
//   Box paymentCardBox = Hive.box('PaymentCard');
//   Box remoteConfigBox = Hive.box('RemoteConfig');
//   Box themeBox = Hive.box('Theme');

// //! Bookmark

//   void addBookmark(News news) {
//     if (!bookmarkBox.values.contains(news)) {
//       bookmarkBox.add(news).then(
//             (value) => snackbar(
//               title: 'Added',
//               message: news.title,
//             ),
//           );
//     } else {
//       snackbar(
//         title: 'Already added',
//         message: news.title,
//       );
//     }
//   }

//   void deleteBookmark(int index) {
//     bookmarkBox.deleteAt(index).then(
//           (value) => snackbar(
//             title: 'Deleted',
//             message: 'Removed Successfully',
//           ),
//         );
//   }

//   //! Payment Card

//   void addPaymentCard(PaymentCardModel card) {
//     paymentCardBox.add(card).then(
//           (value) => snackbar(
//             title: 'Card added',
//             message: 'Your card has been saved successfully',
//           ),
//         );
//   }

//   void deletePaymentCard(int index) {
//     paymentCardBox.deleteAt(index).then(
//           (value) => snackbar(
//             title: 'Deleted',
//             message: 'Removed Successfully',
//             bgColor: Styles.warningColor,
//           ),
//         );
//   }

//   void deleteAllPaymentCard() {
//     paymentCardBox.clear();
//   }

//   //! RemoteConfig
//   DateTime expiryTime() {
//     final DateTime _time = remoteConfigBox.get(0) as DateTime;

//     // return _time;
//     return _time ?? DateTime.fromMillisecondsSinceEpoch(1546553448639);
//   }
// }
