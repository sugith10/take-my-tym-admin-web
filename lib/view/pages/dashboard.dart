import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/view/utils/app_colors.dart';

class DashDoardPage extends StatelessWidget {
  const DashDoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Spacer(),
                //  const Expanded(
                //     child: SearchField(),
                //   ),
                //   Row(children: [],)
              ],
            )
            // Container(
            //   height: 400,
            //   width: double.infinity,

            //   color: Colors.green,
            // ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {},
              radius: 10,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  )),
            ),
          ),
          fillColor: MyAppColors.fillColor.withOpacity(0.9),
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
