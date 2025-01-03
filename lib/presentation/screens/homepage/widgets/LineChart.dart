import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';

class LineChartWidget extends StatefulWidget {
  final String title;

  const LineChartWidget({required this.title, Key? key}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch the data when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PVController>(context, listen: false).fetchMonthlyPVCounts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PVController>(
      builder: (context, pvController, child) {
        final monthlyPVCounts = pvController.monthlyPVCounts;

        // Create a list of FlSpot using the fetched monthly PV counts
        List<FlSpot> spots = List.generate(12, (index) {
          return FlSpot(
            index.toDouble(),
            monthlyPVCounts.length > index ? monthlyPVCounts[index].toDouble() : 0,
          );
        });

        if (spots.isEmpty) {
          return const Center(child: Text("No data available for the chart"));
        }

        // Calculate max Y value
        final maxYValue = monthlyPVCounts.isNotEmpty
            ? monthlyPVCounts.reduce((a, b) => a > b ? a : b).toDouble()
            : 10;

        // Calculate step size for 5 intervals
        final step = (maxYValue / 5).ceil(); // Divide max by 5 and round up
        final adjustedMaxY = step * 5; // Adjust max Y to fit 5 steps

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250, // Set a fixed height for the chart
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: step.toDouble(), // Use calculated step size
                        getTitlesWidget: (value, meta) {
                          // Show Y-axis labels
                          return Text(value.toStringAsFixed(0));
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Disable right Y-axis
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          if (value % 1 == 0 && value >= 0 && value <= 11) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text('Jan');
                              case 1:
                                return const Text('Feb');
                              case 2:
                                return const Text('Mar');
                              case 3:
                                return const Text('Apr');
                              case 4:
                                return const Text('May');
                              case 5:
                                return const Text('Jun');
                              case 6:
                                return const Text('Jul');
                              case 7:
                                return const Text('Aug');
                              case 8:
                                return const Text('Sep');
                              case 9:
                                return const Text('Oct');
                              case 10:
                                return const Text('Nov');
                              case 11:
                                return const Text('Dec');
                              default:
                                return const Text('');
                            }
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Disable top axis
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: const Color(0xFF4A4A31), width: 1),
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
                    touchSpotThreshold: 10,
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0, // Always start from 0
                  maxY: adjustedMaxY.toDouble(), // Use adjusted max value
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
