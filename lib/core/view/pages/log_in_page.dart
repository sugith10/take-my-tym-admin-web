import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: Center(
        child: Card(
          elevation: 5,
          color: const Color.fromARGB(255, 255, 255, 255),
          surfaceTintColor: Colors.transparent,
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return SizedBox(
                height: .7.sh,
                width: .9.sw,
                child: Column(
                  children: [
                    const LoginPageTextField(),
                    SizedBox(height: 50.h),
                    const LoginPageTextField(),
                  ],
                ),
              );
            } else {
              return SizedBox(
                height: .7.sh,
                width: .7.sw,
                child: Row(
                  children: [
                    SizedBox(
                      width: .35.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const LoginPageTextField(),
                          SizedBox(height: 50.h),
                          const LoginPageTextField(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: .35.sw,
                      child: Lottie.asset(
                        'asset/Animation - 1713087538291.json',
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
    );
  }
}

class LoginPageTextField extends StatelessWidget {
  const LoginPageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          filled: true,
          fillColor: Color.fromARGB(255, 238, 238, 238),
        ),
      ),
    );
  }
}
