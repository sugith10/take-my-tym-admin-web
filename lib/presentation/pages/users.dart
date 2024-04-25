import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/presentation/widgets/data_table_container.dart';
import 'package:take_my_tym_admin/presentation/widgets/header_widget.dart';
import 'package:take_my_tym_admin/presentation/widgets/transactions_hightlight_cards.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWidget(),
          const TransactionsHighlightCard(),
          const SizedBox(height: 10),
          DataTableContainer(
            dataTableWidget: UserModelWidget(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class UserModelWidget extends StatelessWidget {
  const UserModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 50,
            width: double.infinity,
            color: MyAppColors.fillColor,
          ),
        ),
         const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
