import 'package:take_my_tym_admin/data/model/business_card_model.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';

class HealthDetails {
  static const List<BusinessModel> healthData = [
    BusinessModel(icon: MyAppImages.users, value: "users", title: "Total Users"),
    BusinessModel(
        icon: MyAppImages.business, value: "buyTymPost", title: "Active Posts"),
    BusinessModel(
        icon: MyAppImages.contract, value: "contracts", title: "Total Contracts"),
    BusinessModel(icon: MyAppImages.money, value: "contracts", title: "Completed Contracts")
  ];
}
