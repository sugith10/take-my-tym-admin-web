import 'package:take_my_tym_admin/data/services/auth_service.dart';
import 'package:take_my_tym_admin/util/app_exception.dart';

class AuthRepo {
  Future<void> signIn({required String email, required String password}) async {
    try {
      await AuthService().emailSignIn(email, password);

      return;
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(
        alert: e.toString(),
        details: 'Check RemoteDataSource',
      );
    }
  }

  Future<void> signOut() async {
    try {
      await AuthService().signOut();
      return;
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(
        alert: e.toString(),
        details: 'Check RemoteDataSource',
      );
    }
  }
}
