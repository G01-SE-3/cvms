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

    // Fetch monthly PV counts after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PVController>(context, listen: false).fetchMonthlyPVCounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PVController>(
      builder: (context, pvController, child) {
        final monthlyPVCounts = pvController.monthlyPVCounts;

        // Handle cases where the data is empty or zero
        if (monthlyPVCounts.isEmpty || monthlyPVCounts.every((pv) => pv == 0)) {
          return const SizedBox.shrink(); // Render nothing if no data
        }

        // Generate the data points (FlSpot) for the line chart
        List<FlSpot> spots = List.generate(12, (index) {
          return FlSpot(
            index.toDouble(),
            monthlyPVCounts.length > index
                ? monthlyPVCounts[index].toDouble()
                : 0, // Default to 0 if data is missing
          );
        });

        // Calculate the maximum Y value and adjust for consistent scaling
        final maxYValue =
            monthlyPVCounts.reduce((a, b) => a > b ? a : b).toDouble();
        final step = (maxYValue / 5).ceil(); // Define step size for Y-axis
        final adjustedMaxY = step * 5; // Round up to the nearest multiple of 5

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title for the chart
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Container for the line chart
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true), // Enable grid lines
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: step.toDouble(), // Set Y-axis intervals
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
                          // Display month names for X-axis labels
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
                      isCurved: true, // Smooth line curve
                      color: const Color.fromARGB(255, 59, 108, 61),
                      dotData: const FlDotData(show: true), // Enable dots on data points
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color.fromARGB(98, 48, 120, 50), // Fill under the line
                      ),
                    ),
                  ],
                  lineTouchData: const LineTouchData(
                      touchTooltipData: LineTouchTooltipData(),
                      touchSpotThreshold: 10), // Enable touch interactions
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: adjustedMaxY.toDouble(), // Set Y-axis max value
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
