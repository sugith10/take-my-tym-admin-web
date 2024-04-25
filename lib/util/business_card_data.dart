
import 'package:take_my_tym_admin/data/model/business_card_model.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';

class HealthDetails {
  final healthData = <BusinessModel>[
    BusinessModel(icon: MyAppImages.users, 
    value: "100", title: "Total Users"),
     BusinessModel(icon: MyAppImages.business, 
    value: "100", title: "Total Posts"),
     BusinessModel(icon: MyAppImages.contract, 
    value: "100", title: "Total Contracts"),
     BusinessModel(icon: MyAppImages.money, 
    value: "100", title: "Total Profit")
  ];
}
