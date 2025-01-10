/*
File Name: pv_model.dart
Purpose: This file defines the OffenderModel Model

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/pv/offender.dart';

class OffenderModel {
  final String id;
  final String type;
  final String? name;
  final String? rcNumber;
  OffenderModel(
      {required this.id, required this.type, this.name, this.rcNumber});

  Offender toEntity() {
    return Offender(id: id, type: type, name: name, rcNumber: rcNumber);
  }
}
