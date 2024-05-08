import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context) ? _logo(40) : _logo(30);
  }

  Text _logo(double size) {
    return Text(
      'TAKEMYTYM',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontSize: size,
      ),
    );
  }
}
