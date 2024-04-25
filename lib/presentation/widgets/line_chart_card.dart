import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:take_my_tym_admin/util/line_chart_data.dart';
import 'package:take_my_tym_admin/presentation/widgets/coustom_card.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Turnover Overview",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: LineChart(
                LineChartData(
                  lineTouchData: const LineTouchData(
                    handleBuiltInTouches: true,
                  ),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return data.bottomTitle[value.toInt()] != null
                              ? SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    data.bottomTitle[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[400]),
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return data.leftTitle[value.toInt()] != null
                              ? Text(data.leftTitle[value.toInt()].toString(),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[400]))
                              : const SizedBox();
                        },
                        showTitles: true,
                        interval: 1,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      preventCurveOverShooting: true,
                      color: const Color.fromARGB(255, 34, 44, 67)
                          .withOpacity(0.5),
                      barWidth: 2.5,
                      belowBarData: BarAreaData(
                        gradient: LinearGradient(
                           begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF4880FF).withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                        show: true,
                      ),
                      dotData: const FlDotData(show: false),
                      spots: data.spots,
                    )
                  ],
                  minX: 0,
                  maxX: 120,
                  maxY: 105,
                  minY: -5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
