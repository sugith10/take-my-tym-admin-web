import 'dart:developer';
import 'package:take_my_tym_admin/data/services/auth_service.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';

class AuthRepo {
  Future<void> signIn({required String email, required String password}) async {
    try {
      log(email);
      log(password);
      await AuthService().emailSignIn(email, password);
      log("success");
      return;
    } on AppException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      throw const AppException(
        alert: 'Something went wrong',
        details: 'Check RemoteDataSource',
      );
    }
  }

  Future<void> signOut()async{
    try{
      await AuthService().signOut();
      return;
    }on AppException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      throw const AppException(
        alert: 'Something went wrong',
        details: 'Check RemoteDataSource',
      );
    }
  }

  
}
