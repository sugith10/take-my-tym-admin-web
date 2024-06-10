part of 'log_in_page.dart';

class _MobileLoginCard extends StatelessWidget {
  final TextEditingController emailCntrl;
  final TextEditingController passwordCntrl;
  final VoidCallback callback;
  const _MobileLoginCard({
    required this.emailCntrl,
    required this.passwordCntrl,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .8.sh,
      width: .9.sw,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const AppLogo(),
              const SizedBox(height: 30),
              LoginPageTextField(
                hint: "Email ID",
                icon: CupertinoIcons.mail,
                controller: emailCntrl,
              ),
              SizedBox(height: 25.h),
              LoginPageTextField(
                hint: 'Password',
                icon: Icons.mail_outline_rounded,
                controller: passwordCntrl,
                show: true,
              ),
              SizedBox(height: 35.h),
              LogInButton(
                callback: () {
                  callback();
                },
              ),
              const ContactAdminWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopLoginCard extends StatelessWidget {
  final TextEditingController emailCntrl;
  final TextEditingController passwordCntrl;
  final VoidCallback callback;
  const _DesktopLoginCard({
    required this.emailCntrl,
    required this.passwordCntrl,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .8.sh,
      width: .7.sw,
      child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: .35.sw,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const AppLogo(),
                    const SizedBox(height: 30),
                    LoginPageTextField(
                      hint: "Email ID",
                      icon: CupertinoIcons.envelope,
                      controller: emailCntrl,
                    ),
                    SizedBox(height: 20.h),
                    LoginPageTextField(
                      hint: 'Password',
                      icon: Icons.password_rounded,
                      controller: passwordCntrl,
                      show: true,
                    ),
                    SizedBox(height: 30.h),
                    LogInButton(
                      callback: () {
                        callback();
                      },
                    ),
                    const ContactAdminWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: .35.sw,
              child: Lottie.asset(
                MyAppLottie.login,
                repeat: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  final VoidCallback callback;
  const LogInButton({
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ButtonStyle(minimumSize: WidgetStatePropertyAll(Size(500, 60.h))),
      child: const Text("Log In"),
    );
  }
}
