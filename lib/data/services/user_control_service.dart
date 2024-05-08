import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';

class UserControl {
  Future<void> blockUser(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'blocked': true});
    } catch (e) {
      log(e.toString());
      throw const AppException();
    }
  }


// Unblock a user
  Future<void> unblockUser(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'blocked': false});
    } catch (e) {
      log(e.toString());
    }
  }
}
