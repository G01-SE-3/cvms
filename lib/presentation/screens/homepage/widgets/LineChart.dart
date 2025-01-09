import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';

import '../constants/Strings/LineChart.dart';

class LineChartWidget extends StatefulWidget {
  final String title;

  const LineChartWidget({required this.title, super.key});

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PVController>(context, listen: false).fetchMonthlyPVCounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PVController>(
      builder: (context, pvController, child) {
        final monthlyPVCounts = pvController.monthlyPVCounts;

        // Handle empty or zero data scenario
        if (monthlyPVCounts.isEmpty || monthlyPVCounts.every((pv) => pv == 0)) {
          return const SizedBox.shrink(); // Render nothing
        }

        // Generate FlSpot data for the chart
        List<FlSpot> spots = List.generate(12, (index) {
          return FlSpot(
            index.toDouble(),
            monthlyPVCounts.length > index
                ? monthlyPVCounts[index].toDouble()
                : 0,
          );
        });

        // Calculate max Y value for the chart's Y-axis range
        final maxYValue =
            monthlyPVCounts.reduce((a, b) => a > b ? a : b).toDouble();
        final step = (maxYValue / 5).ceil();
        final adjustedMaxY = step * 5;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: step.toDouble(),
                        getTitlesWidget: (value, meta) {
                          return Text(value.toStringAsFixed(0));
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          if (value % 1 == 0 && value >= 0 && value <= 11) {
                            switch (value.toInt()) {
                              case 0:
                                return Text(LineChartStrings.january);
                              case 1:
                                return Text(LineChartStrings.february);
                              case 2:
                                return Text(LineChartStrings.march);
                              case 3:
                                return Text(LineChartStrings.april);
                              case 4:
                                return Text(LineChartStrings.may);
                              case 5:
                                return Text(LineChartStrings.june);
                              case 6:
                                return Text(LineChartStrings.july);
                              case 7:
                                return Text(LineChartStrings.august);
                              case 8:
                                return Text(LineChartStrings.september);
                              case 9:
                                return Text(LineChartStrings.october);
                              case 10:
                                return Text(LineChartStrings.november);
                              case 11:
                                return Text(LineChartStrings.december);
                              default:
                                return const Text('');
                            }
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xFF4A4A31), width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: const Color.fromARGB(255, 59, 108, 61),
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color.fromARGB(98, 48, 120, 50),
                      ),
                    ),
                  ],
                  lineTouchData: const LineTouchData(
                      touchTooltipData: LineTouchTooltipData(),
                      touchSpotThreshold: 10),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: adjustedMaxY.toDouble(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
