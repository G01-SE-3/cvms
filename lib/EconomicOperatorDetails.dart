import 'package:flutter/material.dart';


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
            _buildSidebar(),
            // Main Content wrapped in a scrollable widget
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderSection(),
                    const Divider(color: Colors.grey),
                    const MainTabBar(),
                    const SizedBox(height: 10),
                    _buildEconomicOperatorsText(),
                    _buildTabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: const Color(0xFF545837),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildMenuTile(Icons.menu, 40, Colors.black),
          _buildMenuTile(Icons.menu, 18, Colors.white, 'Dashboard'),
          _buildMenuTile(Icons.search_sharp, 18, Colors.white, 'PVs'),
          _buildMenuTile(Icons.people, 18, Colors.white, 'Inspectors'),
          _buildMenuTile(Icons.person, 18, Colors.white, 'Economic Operators'),
          const Spacer(),
          _buildMenuTile(Icons.help, 18, Colors.white, 'Help'),
          _buildMenuTile(Icons.settings, 18, Colors.white, 'Settings'),
        ],
      ),
    );
  }

  ListTile _buildMenuTile(IconData icon, double size, Color color, [String? title]) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: size,
      ),
      title: title != null
          ? Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )
          : null,
      onTap: () {},
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Commercial Violations Management System",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Icon(Icons.bungalow, size: 18.0),
          SizedBox(width: 15),
          Icon(Icons.build, size: 18.0),
        ],
      ),
    );
  }

  Widget _buildEconomicOperatorsText() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 10),
          children: [
            WidgetSpan(
              child: SizedBox(width: 35),
            ),
            TextSpan(
              text: "Economic Operators /",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: "Individual Offenders",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            "Sample Name",
            style: TextStyle(color: Colors.black, fontSize: 34),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: _buildActionButtons(),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PersonalInformationPage(),
                const SizedBox(height: 16), // Adding space between widgets
                const Text(
                    "Associated PVs",
                    style: TextStyle(
                        color: Color(0xFF73AC8A),
                        fontSize: 16, // Optional: Adjust font size
                      ),
                  ),
                ],
            ),
        )

      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 35),
        const Text(
          "Individual Economic Operator",
          style: TextStyle(fontSize: 12),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child: const Text(
            "Edit",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545837),
          ),
          child: const Text(
            "Export",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFCF4CF),
          ),
          child: const Text(
            "Report",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

// Sidebar TabBar
class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      tabs: [
        Tab(text: 'PV'),
        Tab(text: 'Inspectors'),
        Tab(text: 'Economic Operators'),
      ],
    );
  }
}

// PersonalInformationPage definition
class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              // Header
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFDDE5CD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                width: 1300,
                child: const Text(
                  'Personal Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              
              // Table Container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                padding: const EdgeInsets.all(16.0),
                width: 1800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow('Name', 'sample name'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Surname', 'sample surname'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Date and place of birth', '12/12/2000'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Birth certificate number', '4556856'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Mother’s name and surname', 'sample name'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Father’s name', 'Sample name'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Address', 'sample address'),
                    const Divider(color: Colors.grey,),
                    buildInfoRow('Business address', 'sample address'),
                    const Divider(color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF638773)
            ),
          ),
          Text(
            value,
            style:const TextStyle(
              color: Color(0xFF121714)
          )),
        ],
      ),
    );
  }
}
