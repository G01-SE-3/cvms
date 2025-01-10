/*
File Name: pv_model.dart
Purpose: This file defines the SeizureModel Model

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/seizure.dart';

class SeizureModel {
  final int seizureId;
  final String seizureAmount;
  final String seizureQuantity;
  final String seizedGoods;

  SeizureModel({
    required this.seizureId,
    required this.seizureAmount,
    required this.seizureQuantity,
    required this.seizedGoods,
  });

  Seizure toEntity() {
    return Seizure(
      seizureAmount: seizureAmount,
      seizureQuantity: seizureQuantity,
      seizedGoods: seizedGoods,
    );
  }
}
