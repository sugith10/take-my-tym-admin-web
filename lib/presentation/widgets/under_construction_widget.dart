import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_assets.dart';

class UnderConstructionWidget extends StatelessWidget {
  const UnderConstructionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyAppImages.underConstruction,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}