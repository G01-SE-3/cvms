/*
File Name: <PersonalInformationPage.dart>
Purpose: <Displays a personal information page with a header and a table containing various details>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:flutter/material.dart'; 
import 'package:cvms/presentation/screens/EconomicOperatorDetails/constants/strings/EconomicOperatorpersonalInformation.dart';
import 'InfoRow.dart';
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
                child: Text(
                  PersonalInformation,
                  style: const TextStyle(
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
                    InfoRow(Name, samplename),
                    const Divider(color: Colors.grey,),
                    InfoRow(Surname, samplesurname),
                    const Divider(color: Colors.grey,),
                    InfoRow(birthInfo, Dateandplaceofbirth),
                    const Divider(color: Colors.grey,),
                    InfoRow(Birthcertificatenumber, Simple),
                    const Divider(color: Colors.grey,),
                    InfoRow(Mothernameandsurname, samplename),
                    const Divider(color: Colors.grey,),
                    InfoRow(Fathername, samplename),
                    const Divider(color: Colors.grey,),
                    InfoRow(Address, sampleaddress),
                    const Divider(color: Colors.grey,),
                    InfoRow(Businessaddress, sampleaddress),
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



