import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:btb/core/app_users.dart';
import 'package:btb/core/global_variables.dart';
import 'package:btb/core/theme/styles.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:btb/view/widgets/widgets.dart';

import '../core/global_variables.dart';
import '../view/widgets/widgets.dart';

class UserController extends GetxController {
  Rx<AppUser>? userB;
  AppUser get user => userB!.value;

  Stream<AppUser> userStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) {
      if (event.exists) {
        if (!event.data()!.containsKey('groupKeys')) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({'groupKeys': []});
        }
        if (!event.data()!.containsKey('groupKeys')) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({'cartList': []});
        }
      } else {
        firstRegisterUser('');
      }
      return AppUser.fromMap(event.data() as Map<String, dynamic>);
    });
  }

  Future<void> disableUserFromPosting(String userID) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .update({"canPost": false}).then((value) {
      MyWidgets.snackbar(
        title: "Disabled",
        bgColor: Styles.warningColor,
      );
    });
  }

  Future<void> enableUserToPost(String userID) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .update({"canPost": true}).then((value) {
      MyWidgets.snackbar(
        title: "Enabled",
        bgColor: Colors.green,
      );
    });
  }

  Future<bool> isUserRegistered(String userID) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .snapshots()
        .isEmpty;
  }

  Future<void> firstRegisterUser(String phonenumber) async {
    final Map<String, dynamic> docMap = {
      'uid': MyGlobals.firebaseCurrentUser!.uid,
      'username': MyGlobals.firebaseCurrentUser!.displayName,
      'profilePic': MyGlobals.firebaseCurrentUser!.photoURL,
      'email': MyGlobals.firebaseCurrentUser!.email,
      'adminTypes': ['User'],
      'timeCreated': Timestamp.now(),
      'access': [],
      'groupKeys': [],
      "pqExpiration": Timestamp.fromDate(DateTime(2022, 1, 10)),
      'canPost': true,
      'phoneNumber': phonenumber,
    };

    MyGlobals.userCollection
        .doc(MyGlobals.firebaseCurrentUser!.uid)
        .set(docMap)
        .then(
      (value) async {
        MyWidgets.snackbar(
          title: 'Successful',
          message: 'Registration completed',
        );
        // MyWidgets.goReplaceAll(HomePage());
      },
    );
  }

  //! We need to move =>
  //? New Section

  DocumentSnapshot? userDoc;
  Rx<List<String>> urlValue = Rx<List<String>>([]);

  Future<void> updateUserPhoneNumber({
    required String uid,
    required String username,
    required String phoneNumber,
  }) async {
    final Map<String, dynamic> docMap = {
      'username': username,
      'phoneNumber': phoneNumber,
    };

    await MyGlobals.userCollection.doc(uid).update(docMap).then(
      (value) async {
        MyWidgets.snackbar(
          title: 'Successful',
          message: 'Profile updated',
          bgColor: Styles.primaryColor,
        );
      },
    );
  }

  Future<void> saveUserPhoneNumber({
    required String uid,
    required String phoneNumber,
  }) async {
    await MyGlobals.userCollection
        .doc(uid)
        .update({'phoneNumber': phoneNumber}).then(
      (value) async {
        MyWidgets.snackbar(
          title: 'Successful',
          message: 'Contact Info updated',
          bgColor: Styles.primaryColor,
        );
      },
    );
  }
}
