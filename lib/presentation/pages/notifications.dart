import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/presentation/widgets/header_widget.dart';
import 'package:take_my_tym_admin/presentation/widgets/under_construction_widget.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: const UnderConstructionWidget(),
          ),
        ],
      ),
    );
  }
}

