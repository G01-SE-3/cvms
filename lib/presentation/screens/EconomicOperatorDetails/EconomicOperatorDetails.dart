import 'package:flutter/material.dart';
import 'widgets/TabContent.dart';

class EconomicOperatorDetails extends StatelessWidget {
  const EconomicOperatorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabContent(),
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


