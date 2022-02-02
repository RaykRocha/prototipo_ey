import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:prototipo_ey/constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "LEAD",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: Colors.blue,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Colors.amber,
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Colors.green,
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Colors.purple,
    value: 15,
    showTitle: false,
    radius: 16,
  ),
];
