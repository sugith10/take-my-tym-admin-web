import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';

class MyAppTheme {
  final ThemeData themData = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: MyAppColors.scaffoldColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 28.sp,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
        fontSize: 25.sp,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 23.sp,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 19.sp,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
      ),
      titleMedium: TextStyle(
        fontSize: 17.sp,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
      ),
      labelLarge: TextStyle(
        fontSize: 15.sp,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
      ),
      labelSmall: TextStyle(
        fontSize: 13.sp,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.sp,
      ),
      bodyMedium: TextStyle(
        fontSize: 13.sp,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // minimumSize: Size(50.sp, 50.sp),
        // maximumSize: Size(500.sp, 100.sp),
        animationDuration: const Duration(milliseconds: 200),
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        iconColor: WidgetStatePropertyAll(Colors.black),
        mouseCursor: WidgetStatePropertyAll(
          WidgetStateMouseCursor.clickable,
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        shape: WidgetStatePropertyAll(CircleBorder()),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
  );
}
