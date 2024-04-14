import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym_admin/view/navigation/page_names.dart';
import 'package:take_my_tym_admin/view/widgets/svg_image_widget.dart';

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
                return SizedBox(
                  height: .8.sh,
                  width: .9.sw,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SVGImageWidget(
                            asset: "asset/TAKEMYTYM.svg",
                            paddingB: 20,
                            paddingT: 20,
                            paddingL: 40,
                            paddingR: 40,
                          ),
                          SizedBox(height: 20.h),
                          const LoginPageTextField(
                            hint: "Email ID",
                            icon: CupertinoIcons.mail,
                          ),
                          SizedBox(height: 25.h),
                          const LoginPageTextField(
                            hint: 'Password',
                            icon: Icons.mail_outline_rounded,
                          ),
                          SizedBox(height: 35.h),
                          const LogInButton(),
                          const ContactAdminWidget(),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: .8.sh,
                  width: .7.sw,
                  child: Row(
                    children: [
                      SizedBox(
                        width: .35.sw,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const SVGImageWidget(
                                  asset: "asset/TAKEMYTYM.svg",
                                  paddingL: 40,
                                  paddingR: 40,
                                  paddingB: 40,
                                  paddingT: 15,
                                ),
                                const LoginPageTextField(
                                  hint: "Email ID",
                                  icon: CupertinoIcons.envelope,
                                ),
                                SizedBox(height: 20.h),
                                const LoginPageTextField(
                                  hint: 'Password',
                                  icon: Icons.password_rounded,
                                ),
                                SizedBox(height: 30.h),
                                const LogInButton(),
                                const ContactAdminWidget(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: .35.sw,
                        child: Lottie.asset(
                          'asset/log_in_screen_animation.json',
                          repeat: false,
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class ContactAdminWidget extends StatelessWidget {
  const ContactAdminWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        Divider(),
        SizedBox(height: 20),
        Text(
          'For issues, contact the system administrator directly.',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go("/${PageName.home}");
      },
      style:
          ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(500, 60.h))),
      child: const Text("Log In"),
    );
  }
}

class LoginPageTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  const LoginPageTextField({
    required this.hint,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelSmall),
        SizedBox(height: 10.h),
        TextField(
          style: Theme.of(context).textTheme.labelLarge,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              icon,
              weight: 10,
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide:BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: const OutlineInputBorder(
                borderSide:BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: const Color.fromARGB(255, 238, 238, 238).withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
