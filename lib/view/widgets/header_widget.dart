import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/view/widgets/log_out_button.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          const SizedBox(height: 18),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!Responsive.isDesktop(context))
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.menu_rounded,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              if (!Responsive.isMobile(context))
                // SizedBox(
                //   width: 150.w,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 10, right: 10),
                //     child: TextField(
                //       decoration: InputDecoration(
                //         prefix: const SizedBox(
                //           width: 10,
                //         ),
                //         suffixIcon: InkWell(
                //           borderRadius:
                //               BorderRadius.circular(MyAppRadius.halfRound),
                //           onTap: () {},
                //           child: const Padding(
                //             padding: EdgeInsets.only(right: 5),
                //             child: Icon(
                //               Icons.search_rounded,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //         hintText: 'Search',
                //         fillColor: MyAppColors.fillColor.withOpacity(0.9),
                //         filled: true,
                //         enabledBorder: outlineInputBorder(),
                //         focusedBorder: outlineInputBorder(),
                //         contentPadding: const EdgeInsets.symmetric(
                //           vertical: 5,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              // if (Responsive.isMobile(context))
              //   IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.search_rounded),
              //   ),
             const Spacer(flex: 1,),
            const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: LogOutButton(),
                ),
              
            ],
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  // outlineInputBorder() {
  //   return const OutlineInputBorder(
  //     borderSide: BorderSide(color: Color(0xFFD5D5D5)),
  //     borderRadius: BorderRadius.all(Radius.circular(MyAppRadius.halfRound)),
  //   );
  // }
}
