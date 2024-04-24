part of 'log_in_page.dart';

class _MobileLoginCard extends StatelessWidget {
  const _MobileLoginCard();

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
              const SVGImageWidget(
                asset: MyAppSVG.logo,
                paddingB: 20,
                paddingT: 20,
                paddingL: 40,
                paddingR: 40,
                width: 40,
                height: 30,
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
  }
}

class _DesktopLoginCard extends StatelessWidget {
  const _DesktopLoginCard();

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
                    const SVGImageWidget(
                      asset: MyAppSVG.logo,
                      paddingL: 40,
                      paddingR: 40,
                      paddingB: 20,
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
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor:
                const Color.fromARGB(255, 238, 238, 238).withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
