import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/widgets/data_column_title.dart';
import 'package:take_my_tym_admin/view/widgets/data_table_container.dart';

import '../../data/model/contract_model.dart';
import '../../data/repositories/payment_repo.dart';
import '../../util/time_stamp_to_date.dart';

class TransactionsTableWidget extends StatelessWidget {
  const TransactionsTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataTableContainer(
      dataTableWidget: _TransactionDataTable(),
    );
  }
}

class _TransactionDataTable extends StatelessWidget {
  const _TransactionDataTable();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('contracts')
            .where(
              "contractEnded",
              isEqualTo: true,
            )
            .where(
              "paymentApproved",
              isEqualTo: false,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text('No completed transactions are there');
          }
          final List<ContractModel> contractsList = snapshot.data!.docs
              .map((doc) => ContractModel.fromMap(
                  doc.data() as Map<String, dynamic>, doc.id))
              .toList();
          return DataTable(
            columns: const [
              DataColumn(label: DataColumnTitle(title: 'Date')),
              DataColumn(label: DataColumnTitle(title: 'Transaction ID')),
              DataColumn(label: DataColumnTitle(title: 'Client ID')),
              DataColumn(label: DataColumnTitle(title: 'Service Provider ID')),
              DataColumn(label: DataColumnTitle(title: 'Payment Status')),
              // DataColumn(label: DataColumnTitle(title: 'Profit')),
            ],
            rows: List<DataRow>.generate(
              contractsList.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(timestampToDate(contractsList[index].date))),
                  DataCell(Text(contractsList[index].paymentId)),
                  DataCell(Text(contractsList[index].clientId)),
                  DataCell(Text(contractsList[index].serviceProviderId)),
                  DataCell(ApproveButton(contractModel: contractsList[index])),
                ],
              ),
            ),
          );
        });
  }
}

class ApproveButton extends StatelessWidget {
  final ContractModel contractModel;
  const ApproveButton({
    required this.contractModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              contractModel.contractEnded ? Colors.black : Colors.grey),
      onPressed: () {
        if (contractModel.contractEnded) {
          _showApproveTransactionDialog(
            context: context,
            contractModel: contractModel,
          );
        }
      },
      child: Text(contractModel.contractEnded ? "Approve" : "Waiting"),
    );
  }

  void _showApproveTransactionDialog(
      {required BuildContext context, required ContractModel contractModel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Approve Transaction'),
          content:
              const Text('Are you sure you want to approve this transaction?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Approve'),
              onPressed: () {
                PaymentRepo().pay(
                  serviceProviderId: contractModel.serviceProviderId,
                  paymentId: contractModel.paymentId,
                  amount: contractModel.amount,
                  contractId: contractModel.contractId!,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
