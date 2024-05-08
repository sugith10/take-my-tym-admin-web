import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Lottie.asset(
        MyAppLottie.pageNotFound,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}