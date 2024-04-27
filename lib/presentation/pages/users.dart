import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_my_tym_admin/data/model/user_model.dart';
import 'package:take_my_tym_admin/presentation/widgets/data_column_title.dart';
import 'package:take_my_tym_admin/presentation/widgets/data_table_container.dart';
import 'package:take_my_tym_admin/presentation/widgets/header_widget.dart';
import 'package:take_my_tym_admin/presentation/widgets/transactions_hightlight_cards.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          TransactionsHighlightCard(),
          SizedBox(height: 10),
          UsersTableWidget(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class UsersCardWidget extends StatelessWidget {
  const UsersCardWidget({super.key});

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

class UsersTableWidget extends StatelessWidget {
  const UsersTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const userModel = UserModel(
        uid: '1234231', name: 'Rocky', email: 'rocky@gmail.com', block: false);

    final userModelList = <UserModel>[
      userModel,
      userModel,
      userModel,
      userModel,
      userModel,
    ];
    return DataTableContainer(
      dataTableWidget: DataTable(
        columns: const [
          DataColumn(label: DataColumnTitle(title: 'User Count')),
          DataColumn(label: DataColumnTitle(title: 'UserName')),
          DataColumn(label: DataColumnTitle(title: 'Email')),
          DataColumn(label: DataColumnTitle(title: 'Block')),
        ],
        rows: List<DataRow>.generate(
          userModelList.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(index.toString())),
              DataCell(Text(userModelList[index].name)),
              DataCell(Text(userModelList[index].email)),
              DataCell(Column(
                children: [
                  Switch(
                    activeColor: MyAppColors.secondaryColor,
                      value: (!userModelList[index].block), onChanged: (value) {}),
           
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
