import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym_admin/data/repositories/auth_repo.dart';
import 'package:take_my_tym_admin/view/widgets/app_logo_widget.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';
import 'package:take_my_tym_admin/view/widgets/contact_admin.dart';
import '../../../util/route/page_names.dart';

part 'login_page_widgets.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController emailCntrl = TextEditingController();
  final TextEditingController passwordCntrl = TextEditingController();

  Future<void> login() async {
    try {
      await AuthRepo()
          .signIn(email: emailCntrl.text, password: passwordCntrl.text)
          .then((value) {
        context.go(
          "/${PageName.home}",
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error: Lorem Ipsum is simply dummy text'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailCntrl.dispose();
    passwordCntrl.dispose();
    super.dispose();
  }

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
                return _MobileLoginCard(
                  emailCntrl: emailCntrl,
                  passwordCntrl: passwordCntrl,
                  callback: () {
                    login();
                  },
                );
              } else {
                return _DesktopLoginCard(
                  emailCntrl: emailCntrl,
                  passwordCntrl: passwordCntrl,
                  callback: () {
                    login();
                  },
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
