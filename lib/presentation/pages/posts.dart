import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/presentation/widgets/header_widget.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          
        ],
      ),
    );
  }
}