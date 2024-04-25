import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';
import 'package:take_my_tym_admin/presentation/widgets/svg_image_widget.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      tooltip: 'Log Out',
      icon: const SVGImageWidget(
        asset: MyAppSVG.logout,
        
      ),
    );
  }
}
