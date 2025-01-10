/*
File Name: national_card_reg.dart
Purpose: This file defines the NationalCardRegistration class, which represents the registration details of an individual's national card.
The registration in this NationalCard is for those with severe violations, the registration request is sent to the interior ministry.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/pv/national_card_reg_model.dart';

class NationalCardRegistration {
  final int nationalCardRegId;
  final DateTime nationalCardIssueDate;

  NationalCardRegistration({
    required this.nationalCardRegId,
    required this.nationalCardIssueDate,
  });
  NationalCardRegistrationModel toModel() {
    return NationalCardRegistrationModel(
      nationalCardRegId: nationalCardRegId,
      nationalCardIssueDate: nationalCardIssueDate,
    );
  }
}
