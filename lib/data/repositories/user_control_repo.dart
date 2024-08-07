import 'dart:developer';

import 'package:take_my_tym_admin/data/services/user_control_service.dart';

class UserControlRepo {
  Future<void> blockUser(String userId) async {
    try {
      await UserControl().blockUser(userId);
    } catch (e) {
      log("$e");
    }
  }

  Future<void> unblockUser(String userId) async {
    try {
      await UserControl().unblockUser(userId);
    } catch (e) {
      log("$e");
    }
  }
}
