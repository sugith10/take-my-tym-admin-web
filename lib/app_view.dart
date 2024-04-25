import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym_admin/util/app_theme.dart';
import 'package:take_my_tym_admin/util/route/app_router.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        minTextAdapt: false,
        fontSizeResolver: FontSizeResolvers.radius,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: MyAppTheme().themData,
          );
        });
  }
}
