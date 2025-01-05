import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/Sidebar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cvms/presentation/screens/navigation_bars/HomeAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedTabIndex = -1; // To track navigation bar tab index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(), 
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180.0), // Adjust height as needed
        child: GeneralAppBar(search: false,initialTabIndex:0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row: Statistical Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                    'Total PVs', '1,024', Icons.description, Colors.blue),
                _buildStatCard(
                    'Economic Operators', '542', Icons.business, Colors.green),
                _buildStatCard('Inspectors', '12', Icons.person, Colors.orange),
              ],
            ),
            const SizedBox(height: 30),
            // Second Row: Chart Title and Line Chart
            const Text(
              'Monthly PVs Evolution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _buildLineChart(),
            ),
          ],
        ),
      ),
    );
  }

  // Builds a single stat card
  Widget _buildStatCard(
      String title, String count, IconData icon, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 10),
              Text(
                count,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the histogram-like line chart using fl_chart
  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData:
            const FlGridData(show: true), // Show grid lines for better readability
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
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
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xFF4A4A31), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 30), // Jan
              const FlSpot(1, 45), // Feb
              const FlSpot(2, 60), // Mar
              const FlSpot(3, 50), // Apr
              const FlSpot(4, 70), // May
              const FlSpot(5, 80), // Jun
              const FlSpot(6, 60), // Jul
              const FlSpot(7, 75), // Aug
              const FlSpot(8, 85), // Sep
              const FlSpot(9, 90), // Oct
              const FlSpot(10, 95), // Nov
              const FlSpot(11, 100), // Dec
            ],
            isCurved: false, // Set to false to create straight lines
            color: const Color.fromARGB(
                255, 59, 108, 61), // Color matching your theme
            dotData:
                const FlDotData(show: false), // Hides dots on points for cleaner look
            belowBarData: BarAreaData(
              show: true, // Show area below the line for a filled effect
              color: const Color.fromARGB(
                  98, 48, 120, 50), // Semi-transparent fill color
            ),
          ),
        ],
      ),
    );
  }
}
