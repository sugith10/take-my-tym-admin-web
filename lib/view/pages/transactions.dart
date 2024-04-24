import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/widgets/header_widget.dart';

class DashDoardWidget extends StatelessWidget {
  const DashDoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          
        ],
      ),
    );
  }
}