/*
File Name: offender.dart
Purpose: This file defines the Offender class.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/pv/offender.dart';

class Offender {
  final String id;
  final String type;
  final String? name;
  final String? rcNumber;
  Offender({required this.id, required this.type, this.name, this.rcNumber});
  OffenderModel toModel() {
    return OffenderModel(id: id, type: type, name: name, rcNumber: rcNumber);
  }
}
