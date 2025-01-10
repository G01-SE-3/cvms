/*
File Name: seizure.dart
Purpose: This file defines the Seizure class, which represents a seizure event in the context of a(PV).
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/pv/seizure_model.dart';

class Seizure {
  final String seizureAmount;
  final String seizureQuantity;
  final String seizedGoods;

  Seizure({
    required this.seizureAmount,
    required this.seizureQuantity,
    required this.seizedGoods,
  });
  SeizureModel toModel() {
    return SeizureModel(
      seizureId: 0,
      seizureAmount: seizureAmount,
      seizureQuantity: seizureQuantity,
      seizedGoods: seizedGoods,
    );
  }
}
