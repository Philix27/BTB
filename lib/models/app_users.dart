import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class AppUser extends HiveObject {
  final String uid;
  final String username;
  final String phoneNumber;
  final String profilePic;
  final String email;
  final List<String> adminTypes;
  final List<String> access;
  //? New variables
 
  //? Implement Above

  AppUser({
    required this.uid,
    required this.username,
    required this.email,
    required this.access,
    required this.phoneNumber,
    required this.profilePic,
    required this.adminTypes,
  });

  factory AppUser.fromMap(Map<String, dynamic> doc) {
    return AppUser(
      uid: doc['uid'].toString() , //? => Gotten
      phoneNumber: doc['phoneNumber'].toString() , //? => Gotten
      email: doc['email'].toString() ,
      profilePic: doc['profilePic'].toString() , //? => Settled
      username: doc['username'].toString() ,
      adminTypes:
          List<String>.from(doc['adminTypes'] as Iterable<dynamic>),
      access: List<String>.from(doc['access'] as Iterable<dynamic> ),
    );
  }

  factory AppUser.fromDocumentsnapshot(DocumentSnapshot doc) {
    return AppUser(
      uid: doc['uid'].toString() , //? => Gotten
      phoneNumber: doc['phoneNumber'].toString() , //? => Gotten
      email: doc['email'].toString() ,
      profilePic: doc['profilePic'].toString() , //? => Settled
      username: doc['username'].toString() ,
      adminTypes:
          List<String>.from(doc['adminTypes'] as Iterable<dynamic>),
      access: List<String>.from(doc['access'] as Iterable<dynamic> ),
    );
  }
}
