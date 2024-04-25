import 'package:flutter/material.dart';

class ContactAdminWidget extends StatelessWidget {
  const ContactAdminWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        Divider(),
        SizedBox(height: 20),
        Text(
          'For issues, contact the system administrator directly.',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}