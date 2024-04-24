import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/utils/model/menu_model.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.dashboard_rounded, title: 'Dashboard'),
    MenuModel(icon: Icons.monetization_on, title: 'Transactions'),
    MenuModel(icon: Icons.people_alt_rounded, title: 'Users'),
    MenuModel(icon: Icons.find_in_page, title: 'Posts'),
    MenuModel(icon: Icons.notification_add, title: 'Notifications'),
  ];
}
