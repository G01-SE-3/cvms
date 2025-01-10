/*
File Name: closure.dart
Purpose: This file defines the Closure class, which represents the closure details associated with a PV
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/pv/closure_model.dart';

class Closure {
  final int closureId;
  final DateTime closureOrderDate;
  final String? reopeningRequestNumber;
  final DateTime? reportingDate;
  Closure(
      {required this.closureId,
      required this.closureOrderDate,
      this.reopeningRequestNumber,
      this.reportingDate});

  ClosureModel toModel() {
    return ClosureModel(
      closureId: closureId,
      closureOrderDate: closureOrderDate,
      reopeningRequestNumber: reopeningRequestNumber,
    );
  }
}
