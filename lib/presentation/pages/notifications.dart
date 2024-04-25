import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/presentation/widgets/header_widget.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

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
