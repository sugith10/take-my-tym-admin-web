import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/data/model/user_model.dart';
import 'package:take_my_tym_admin/data/repositories/user_control_repo.dart';
import 'package:take_my_tym_admin/view/widgets/data_column_title.dart';
import 'package:take_my_tym_admin/view/widgets/data_table_container.dart';
import 'package:take_my_tym_admin/view/widgets/header_widget.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No users found');
        }

        final List<UserModel> users = snapshot.data!.docs
            .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
        return DataTableContainer(
          dataTableWidget: DataTable(
            columns: const [
              DataColumn(label: DataColumnTitle(title: 'User Count')),
              DataColumn(label: DataColumnTitle(title: 'UserName')),
              DataColumn(label: DataColumnTitle(title: 'Email')),
              DataColumn(label: DataColumnTitle(title: 'Block')),
            ],
            rows: List<DataRow>.generate(
              users.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text((index + 1).toString())),
                  DataCell(Text(users[index].userName)),
                  DataCell(Text(users[index].email)),
                  DataCell(Column(
                    children: [
                      Switch(
                        inactiveThumbColor: Colors.red,
                        activeColor: MyAppColors.secondaryColor,
                        value: users[index].blocked,
                        onChanged: (value) {
                          if (!value) {
                            UserControlRepo().unblockUser(users[index].uid);
                          } else {
                            UserControlRepo().blockUser(users[index].uid);
                          }
                        },
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
