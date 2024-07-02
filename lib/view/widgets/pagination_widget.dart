import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "1",
            style: TextStyle(color: MyAppColors.secondaryColor),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "2",
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "3",
          ),
        ),
        TextButton(
          style: const ButtonStyle(
            shape: WidgetStatePropertyAll(StadiumBorder()),
          ),
          onPressed: () {},
          child: const Text(
            "See All",
          ),
        )
      ],
    );
  }
}
