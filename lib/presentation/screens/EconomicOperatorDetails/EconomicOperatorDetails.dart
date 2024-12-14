import 'package:flutter/material.dart';
import 'widgets/EconomicOperatorsTextWidget.dart';
import 'widgets/TabContent.dart';
import'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class EconomicOperatorDetails extends StatelessWidget {
  const EconomicOperatorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:const Sidebar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: GeneralAppBar(search:false),
      ),
    
    
     body:DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
        
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EconomicOperatorsTextWidget(),
                    TabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}


