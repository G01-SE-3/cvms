import 'package:flutter/material.dart';
import 'widgets/buildSidebar.dart';
import 'widgets/buildHeaderSection.dart';
import 'widgets/buildEconomicOperatorsText.dart';
import 'widgets/buildTabContent.dart';
import 'widgets/MainTabBar.dart';
class EconomicOperatorDetails extends StatelessWidget {
  const EconomicOperatorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
          children: [
            // Sidebar Menu
            buildSidebar(),
            // Main Content wrapped in a scrollable widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeaderSection(),
                    const Divider(color: Colors.grey),
                    const MainTabBar(),
                    const SizedBox(height: 10),
                    buildEconomicOperatorsText(),
                    buildTabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


