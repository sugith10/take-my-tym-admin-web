import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';
import 'package:take_my_tym_admin/view/widgets/svg_image_widget.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Log Out'),
              content: const Text('Are you sure you want to log out?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {

                    Navigator.of(context).pop(); 
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
      },
      tooltip: 'Log Out',
      icon: const SVGImageWidget(
        asset: MyAppSVG.logout,
      ),
    );
  }
}
