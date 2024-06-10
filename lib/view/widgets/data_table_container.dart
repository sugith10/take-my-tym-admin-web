import 'package:flutter/material.dart';

class DataTableContainer extends StatelessWidget {
  final Widget dataTableWidget;
  const DataTableContainer({
    required this.dataTableWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                dataTableWidget,
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        //  const PaginationWidget(),
        const SizedBox(height: 30),
      ],
    );
  }
}
