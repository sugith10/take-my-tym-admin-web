import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/widgets/header_widget.dart';
import 'package:take_my_tym_admin/view/widgets/transaction_list_widget.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          // TransactionsHighlightCard(),
          SizedBox(height: 10),
          TransactionsTableWidget(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
