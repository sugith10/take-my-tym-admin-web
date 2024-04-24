import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/utils/app_radius.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const CustomCard({super.key, required this.child, this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyAppRadius.borderOne)
        ,color: color ?? const Color.fromARGB(255, 255, 255, 255)
      ),
      child: Padding(padding: padding?? const EdgeInsets.all(12.0),
      child: child,
      ),
    );
  }
}
