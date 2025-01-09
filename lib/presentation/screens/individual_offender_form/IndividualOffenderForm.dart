import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/OffenderForm.dart';
import 'package:cvms/presentation/screens/navigation_bars/GeneralAppBar.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class IndividualOffenderForm extends StatelessWidget {
  const IndividualOffenderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Sidebar(), // Optional sidebar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(220.0), 
        child: GeneralAppBar(
          search: true, 
          initialTabIndex: 4,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IndividualOffenderFormWidget(),
          ],
        ),
      ),
    );
  }
}
