import 'package:flutter/material.dart'; 
import 'buildInfoRow.dart';
class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
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
}



