/*
File Name: pv_repository.dart
Purpose: This file defines the abstract class PVRepository,
which outlines the methods for interacting with the PV data.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/pv.dart';

abstract class PVRepository {
  Future<PV?> getPVById(String pvId);
  Future<List<PV>> getAllPVs();
  Future<void> insertPV(PV pvEntity);
  Future<List<PV>> searchPV(int pvnumber);
  Future<List<PV>> filterByLatest(int number);
  Future<List<PV>> filterByDate(DateTime startDate, DateTime endDate);
  Future<void> updatePV(PV pvEntity);
  Future<void> deletePV(String pvId);
  Future<List<int>> getMonthlyPVCounts();
  Future<int> getTotalPVCount();
}
