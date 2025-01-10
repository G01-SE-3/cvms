/*
File Name: pv_model.dart
Purpose: This file defines the NationalCardRegistrationModel Model

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/pv/national_card_reg.dart';

class NationalCardRegistrationModel {
  final int nationalCardRegId;
  final DateTime nationalCardIssueDate;

  NationalCardRegistrationModel({
    required this.nationalCardRegId,
    required this.nationalCardIssueDate,
  });

  NationalCardRegistration toEntity() {
    return NationalCardRegistration(
      nationalCardRegId: nationalCardRegId,
      nationalCardIssueDate: nationalCardIssueDate,
    );
  }
}
