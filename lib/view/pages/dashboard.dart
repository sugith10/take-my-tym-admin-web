import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/widgets/activity_details_card.dart';
import 'package:take_my_tym_admin/view/widgets/header_widget.dart';
import 'package:take_my_tym_admin/view/widgets/line_chart_card.dart';

class DashDoardWidget extends StatelessWidget {
  const DashDoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          DashboardActivityCard(),
          LineChartCard(),
        ],
      ),
    );
  }
}
