import 'package:flutter/material.dart';

class DataColumnTitle extends StatelessWidget {
  final String title;

  const DataColumnTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        title,
        overflow: TextOverflow.clip,
      ),
    );
  }
}