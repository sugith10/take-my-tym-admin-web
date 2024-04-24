import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_my_tym_admin/view/pages/dashboard.dart';
import 'package:take_my_tym_admin/view/utils/app_responsive.dart';
import 'package:take_my_tym_admin/view/widgets/side_menu_widget.dart';
import 'package:take_my_tym_admin/view/widgets/svg_image_widget.dart';

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
              child: DashDoardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuTablet extends StatelessWidget {
  const SideMenuTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 100,
        color: const Color(0xFFF7F2F9),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Dashboard',
              onPressed: () {},
              icon: const Icon(Icons.dashboard_rounded),
            ),
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Transactions',
              onPressed: () {},
              icon: const Icon(Icons.monetization_on),
            ),
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Users',
              onPressed: () {},
              icon: const Icon(Icons.people_alt_rounded),
            ),
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Posts',
              onPressed: () {},
              icon: const Icon(Icons.find_in_page),
            ),
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Notifications',
              onPressed: () {},
              icon: const Icon(Icons.notification_add),
            ),
            SizedBox(height: 20.h),
            IconButton(
              tooltip: 'Settings',
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            SizedBox(height: 20.h),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                child: SvgPicture.asset(
                  "asset/TAKEMYTYM.svg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuDesktopWidget extends StatelessWidget {
  const SideMenuDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: SVGImageWidget(
                asset: "asset/TAKEMYTYM.svg",
                paddingB: 20,
                paddingT: 20,
                paddingL: 40,
                paddingR: 40,
              ),
            ),
            DrawerListTile(
              icon: Icons.dashboard_rounded,
              title: "DashDoard",
              callback: () {},
            ),
            DrawerListTile(
              icon: Icons.monetization_on,
              title: "Transactions",
              callback: () {},
            ),
            DrawerListTile(
              icon: Icons.people_alt_rounded,
              title: "Users",
              callback: () {},
            ),
            DrawerListTile(
              icon: Icons.find_in_page,
              title: "Posts",
              callback: () {},
            ),
            DrawerListTile(
              icon: Icons.notification_add,
              title: "Notifications",
              callback: () {},
            ),
            DrawerListTile(
              icon: Icons.settings,
              title: "Settings",
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final IconData icon;

  const DrawerListTile({
    required this.title,
    required this.icon,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback();
      },
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
