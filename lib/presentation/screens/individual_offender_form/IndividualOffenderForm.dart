import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/individual_offender_form/widgets/OffenderForm.dart';
import 'package:cvms/presentation/screens/navigation_bars/sidebar.dart';

class IndividualOffenderForm extends StatelessWidget {
  const IndividualOffenderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Offender Form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            IndividualOffenderFormWidget(),
          ],
        ),
      ),
    );
  }
}
