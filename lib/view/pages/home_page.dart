import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:take_my_tym_admin/view/pages/dashboard.dart';
import 'package:take_my_tym_admin/view/utils/app_responsive.dart';
import 'package:take_my_tym_admin/view/widgets/svg_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenuDesktopWidget(),
            ),
          if (Responsive.isTablet(context)) const SideMenuTablet(),
          const Expanded(flex: 5, child: DashDoardPage()),
        ],
      )),
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
      
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            IconButton(
              tooltip: 'Dashboard',
              onPressed: () {},
              icon: const Icon(Icons.dashboard_rounded),
            ),
            IconButton(
              tooltip: 'Transactions',
              onPressed: () {},
              icon: const Icon(Icons.monetization_on),
            ),
            IconButton(
              tooltip: 'Users',
              onPressed: () {},
              icon: const Icon(Icons.people_alt_rounded),
            ),
            IconButton(
              tooltip: 'Posts',
              onPressed: () {},
              icon: const Icon(Icons.find_in_page),
            ),
            IconButton(
              tooltip: 'Notifications',
              onPressed: () {},
              icon: const Icon(Icons.notification_add),
            ),
            IconButton(
              tooltip: 'Settings',
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
            Container(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 50,
                height: 50,
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
