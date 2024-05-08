import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/data/model/transaction_model.dart';
import 'package:take_my_tym_admin/view/widgets/data_column_title.dart';
import 'package:take_my_tym_admin/view/widgets/data_table_container.dart';

class TransactionsTableWidget extends StatelessWidget {
  const TransactionsTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionModel = TransactionModel(
      date: '02:18:23 PM',
      transactionId: '#12548796',
      senderName: 'Lore',
      receiverName: 'Ipsum',
      paymentStatus: 'pending',
    );
    final transactionList = <TransactionModel>[
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
      transactionModel,
    ];
    return DataTableContainer(
      dataTableWidget:  _TransactionDataTable(
        transactionList: transactionList,
      ),
    );
  }
}




class _TransactionDataTable extends StatelessWidget {
  const _TransactionDataTable({

    required this.transactionList,
  });

  final List<TransactionModel> transactionList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: DataColumnTitle(title: 'Date')),
        DataColumn(label: DataColumnTitle(title: 'Transaction ID')),
        DataColumn(label: DataColumnTitle(title: 'Sender Name')),
        DataColumn(label: DataColumnTitle(title: 'Receiver Name')),
        DataColumn(label: DataColumnTitle(title: 'Payment Status')),
        DataColumn(label: DataColumnTitle(title: 'Profit')),
      ],
      rows: List<DataRow>.generate(
        transactionList.length,
        (index) => DataRow(
          cells: [
            DataCell(Text(transactionList[index].date)),
            DataCell(Text(transactionList[index].transactionId)),
            DataCell(Text(transactionList[index].senderName)),
            DataCell(Text(transactionList[index].receiverName)),
            DataCell(Text(transactionList[index].paymentStatus)),
            DataCell(Text(transactionList[index].paymentStatus)),
          ],
        ),
      ),
    );
  }
}

