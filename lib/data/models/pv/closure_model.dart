/*
File Name: pv_model.dart
Purpose: This file defines the ClosureModel class

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/pv/closure.dart';

class ClosureModel {
  final int closureId;
  final DateTime closureOrderDate;
  final String? reopeningRequestNumber;
  final DateTime? reportingDate;

  ClosureModel({
    required this.closureId,
    required this.closureOrderDate,
    this.reopeningRequestNumber,
    this.reportingDate,
  });

  Closure toEntity() {
    return Closure(
      closureId: closureId,
      closureOrderDate: closureOrderDate,
      reopeningRequestNumber: reopeningRequestNumber,
    );
  }
}
