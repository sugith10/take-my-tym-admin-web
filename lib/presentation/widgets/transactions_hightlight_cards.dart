import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_my_tym_admin/util/app_colors.dart';
import 'package:take_my_tym_admin/util/business_card_data.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/presentation/widgets/coustom_card.dart';

class TransactionsHighlightCard extends StatelessWidget {
  const TransactionsHighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final businessInfo = HealthDetails().healthData;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
      ),
      child: GridView.builder(
        itemCount: businessInfo.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) => CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 233, 235, 235),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      "assets/svg/money-bag.svg",
                      height: 70,
                      width: 70,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  businessInfo[index].value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: MyAppColors.secondaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                businessInfo[index].title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 70, 73, 74),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
