import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/view/widgets/log_out_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          const SizedBox(height: 18),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!Responsive.isDesktop(context))
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.menu_rounded,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              if (!Responsive.isMobile(context))
                const Spacer(
                  flex: 1,
                ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: LogOutButton(),
              ),
            ],
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
