import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym_admin/view/navigation/page_names.dart';
import 'package:take_my_tym_admin/view/utils/app_assets.dart';
import 'package:take_my_tym_admin/view/widgets/contact_admin.dart';
import 'package:take_my_tym_admin/view/widgets/svg_image_widget.dart';

part 'login_page_widgets.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        body: Center(
          child: Card(
            elevation: 5,
            color: const Color.fromARGB(255, 255, 255, 255),
            surfaceTintColor: Colors.transparent,
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 768) {
                return  const _MobileLoginCard();
              } else {
                return  const _DesktopLoginCard();
              }
            }),
          ),
        ),
      ),
    );
  }
}

