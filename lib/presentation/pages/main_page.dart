import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/presentation/pages/dashboard.dart';
import 'package:take_my_tym_admin/presentation/pages/notifications.dart';
import 'package:take_my_tym_admin/presentation/pages/transactions.dart';
import 'package:take_my_tym_admin/presentation/pages/users.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/presentation/widgets/side_menu_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer: !isDesktop
          ? const SizedBox(width: 250, child: SideMenuWidget())
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDesktop)
              const Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
            const Expanded(
              flex: 7,
              child:DashDoardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

