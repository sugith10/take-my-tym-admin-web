import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/business_card_data.dart';
import 'package:take_my_tym_admin/util/app_responsive.dart';
import 'package:take_my_tym_admin/view/widgets/coustom_card.dart';

class DashboardActivityCard extends StatelessWidget {
  const DashboardActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
      ),
      child: GridView.builder(
          itemCount: HealthDetails.healthData.length,
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
                        child: Image.asset(
                          HealthDetails.healthData[index].icon,
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 4),
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(HealthDetails.healthData[index].value)
                            .get(),
                        builder: (context, snapShot) {
                          if (snapShot.connectionState ==
                              ConnectionState.done) {
                            return Text(
                              snapShot.data!.docs.length.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    Text(
                      HealthDetails.healthData[index].title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 70, 73, 74),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
