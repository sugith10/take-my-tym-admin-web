import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';

class AuthService {
  ///EMAIL SIGNIN
  Future<void> emailSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final res = await FirebaseFirestore.instance
          .collection("admin")
          .where("uid", isEqualTo: credential.user!.uid)
          .get();

      if (res.docs.isEmpty) {
        throw const AppException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw const AppException(
            alert: 'Network Error',
            details: "Please check your internet connection and try again.");
      } else if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw const AppException(
          alert: 'user-not-found',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw const AppException(
          alert: 'wrong-password',
          details: 'Check RemoteDataSource',
        );
      } else if (e.code == 'invalid-credential') {
        throw const AppException(
          alert: 'Invalid credentials.',
          details: 'Please check your username and password and try again.',
        );
      } else if (e.code == 'too-many-requests') {
        throw const AppException(
          alert: 'Too Many Requests',
          details:
              'We\'re experiencing a high volume of requests. Please try again later...',
        );
      } else {
        log(e.code);
        log(e.toString());
        throw AppException(
          alert: e.code,
          details: 'Check RemoteDataSource',
        );
      }
    } on Exception catch (e) {
      log(e.toString());
      throw const AppException(
        alert: 'Something went wrong',
        details: 'Check RemoteDataSource',
      );
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        return;
      });
      log('Signed out successfully!');
    } catch (e) {
      throw const AppException();
    }
  }
}
