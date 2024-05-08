import 'dart:developer';
import 'package:take_my_tym_admin/data/services/auth_service.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';

class AuthRepo {
  Future<void> signIn({required String email, required String password}) async {
    try {
      log(email);
      log(password);
      await SignInRemoteData().emailSignIn(email, password);
      log("success");
      return;
    } on AppException catch (e) {
      // Rethrow the AppException
      rethrow;
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      throw const AppException(
        alert: 'Something went wrong',
        details: 'Check RemoteDataSource',
      );
    }
  }
}
