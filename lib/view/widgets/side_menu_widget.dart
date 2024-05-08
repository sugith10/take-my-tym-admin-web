import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_my_tym_admin/app.dart';
import 'package:take_my_tym_admin/view/widgets/app_logo_widget.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';
import 'package:take_my_tym_admin/util/side_menu_data.dart';
import 'package:take_my_tym_admin/util/app_radius.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          const SizedBox(height: 25),
          const Center(child: AppLogo()),
          const SizedBox(height: 35),
          const Divider(),
          const SizedBox(height: 45),
          Consumer(builder: (context, ref, child) {
            final selectedIndex = ref.watch(selectedIndexProvider);

            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.menu.length,
              itemBuilder: (
                context,
                index,
              ) =>
                  _buildMenuEntry(
                data: data,
                index: index,
                selectedIndex: selectedIndex,
                context: context,
                ref: ref,
              ),
            );
          }),
        ],
      ),
    );
  }
}

Widget _buildMenuEntry({
  required SideMenuData data,
  required int index,
  required int selectedIndex,
  required BuildContext context,
  required WidgetRef ref,
}) {
  final bool isSelected = selectedIndex == index;
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      height: MyAppRadius.halfRound,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:
            isSelected ? MyAppColors.secondaryColor : MyAppColors.primaryColor,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          ref.watch(selectedIndexProvider.notifier).state = index;
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
