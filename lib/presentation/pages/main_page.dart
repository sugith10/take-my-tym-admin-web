import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_my_tym_admin/app.dart';
import 'package:take_my_tym_admin/presentation/pages/dashboard.dart';
import 'package:take_my_tym_admin/presentation/pages/notifications.dart';
import 'package:take_my_tym_admin/presentation/pages/posts.dart';
import 'package:take_my_tym_admin/presentation/pages/transactions.dart';
import 'package:take_my_tym_admin/presentation/pages/users.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/presentation/widgets/side_menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const DashDoardWidget(),
    const TransactionsWidget(),
    const UsersWidget(),
    const PostsWidget(),
    const NotificationsWidget(),
  ];
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
            Expanded(
              flex: 7,
              child: Consumer(builder: (context, ref, child) {
                final index = ref.watch(selectedIndexProvider);
                return _screens[index];
              }),
            ),
          ],
        ),
      ),
    );
  }
}
