/*
File Name: pv_controller.dart
Purpose: This file defines the PVController class, which is responsible for managing the presentation logic for Process Verbal (PV) entities. The controller interacts with various use cases for fetching, inserting, updating, deleting, and searching PVs. It also handles the loading state and errors, notifying the UI of any state changes.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz
- Team Member 2 hiba.ayadi@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/usecases/pv/TotalPvCount.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byDate.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byLatest.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/search_pv.dart';
import 'package:cvms/domain/usecases/pv/update_pv.dart';
import 'package:cvms/domain/usecases/pv/delete_pv.dart';
import 'package:cvms/domain/usecases/pv/monthlyPvCount.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// The PVController class manages the presentation logic for PV entities.
/// It is responsible for interacting with various use cases related to PVs: fetching,
/// inserting, updating, deleting, and searching PVs. It handles loading states, errors,
/// and notifies the UI of any state changes.

class PVController extends ChangeNotifier {
  final GetPVDetails getPVDetails;
  final GetAllPVs getAllPVs;
  final InsertPV insertPV;
  final GetPVsByNumber searchPV;
  final GetLatestPVs getLatestPVs;
  final GetPVsByDate getPVsByDate;
  final UpdatePV updatePV;
  final DeletePV deletePV;
  final GetMonthlyPVCounts MonthlyPVCounts; // Inject GetMonthlyPVCounts
  final TotalPVCount TotalpVCount; // Inject GetTotalPVCount

  PV? pv;
  List<PV> allPVs = [];
  List<PV> searchResults = [];
  List<PV> latestPVs = [];
  List<PV> dateFilteredPVs = [];
  List<int> monthlyPVCounts = []; // To store the counts of PVs by month
  int totalPVCount = 0; // To store the total PV count
  bool isLoading = false;
  String? errorMessage;

  PVController({
    required this.getPVDetails,
    required this.getAllPVs,
    required this.insertPV,
    required this.searchPV,
    required this.getLatestPVs,
    required this.getPVsByDate,
    required this.updatePV,
    required this.deletePV,
    required this.MonthlyPVCounts, // Inject GetMonthlyPVCounts
    required this.TotalpVCount, // Inject GetTotalPVCount
  });

  Future<void> loadPV(String pvId) async {
    if (pv != null) return;
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      pv = await getPVDetails.execute(pvId);
      errorMessage = null;
      await logger.log("INFO", "Presentation Layer - Loaded PV with ID: $pvId");
    } catch (e) {
      errorMessage = e.toString();
      pv = null;
      await logger.log(
          "ERROR", "Presentation Layer - Failed to load PV with ID: $pvId",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllPVs() async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      allPVs = await getAllPVs.execute();
      errorMessage = null;
      await logger.log("INFO", "Presentation Layer - Loaded all PVs");
    } catch (e) {
      errorMessage = e.toString();
      allPVs = [];
      await logger.log("ERROR", "Presentation Layer - Failed to load all PVs",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Method for inserting a new PV
  Future<void> insertPVData(PV pvData) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      // Calling the insert use case to insert the PV into the database
      await insertPV.execute(pvData);
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Inserted PV with ID: ${pvData.pvId}");
      // Optionally, you can reload the list of PVs after insertion
      await loadAllPVs(); // Refresh list after insert (or load specific PV)
    } catch (e) {
      errorMessage = e.toString();
      await logger.log("ERROR",
          "Presentation Layer - Failed to insert PV with ID: ${pvData.pvId}",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void resetPV() {
    pv = null; // Clear the PV data
    errorMessage = null; // Clear any error messages
    notifyListeners(); // Notify listeners about the change
  }

  Future<List<PV>> searchPVsByNumber(int pvNumber) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      // Assuming the search logic in the use case returns the list of PVs
      searchResults = await searchPV.execute(pvNumber);
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Searched PVs with number: $pvNumber");
      return searchResults; // Return the list of PVs
    } catch (e) {
      errorMessage = e.toString();
      searchResults = [];
      await logger.log("ERROR",
          "Presentation Layer - Failed to search PVs with number: $pvNumber",
          data: {"error": e.toString()});
      return []; // Return an empty list in case of error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<List<PV>> fetchLatestPVs(int number) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      latestPVs = await getLatestPVs.execute(number);
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Fetched latest $number PVs");
      return latestPVs;
    } catch (e) {
      errorMessage = e.toString();
      latestPVs = [];
      await logger.log(
          "ERROR", "Presentation Layer - Failed to fetch latest $number PVs",
          data: {"error": e.toString()});
      return [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<List<PV>> fetchPVsByDate(DateTime startDate, DateTime endDate) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      dateFilteredPVs = await getPVsByDate.execute(startDate, endDate);
      errorMessage = null;
      await logger.log("INFO",
          "Presentation Layer - Fetched PVs between $startDate and $endDate");
      return dateFilteredPVs;
    } catch (e) {
      errorMessage = e.toString();
      dateFilteredPVs = [];
      await logger.log("ERROR",
          "Presentation Layer - Failed to fetch PVs between $startDate and $endDate",
          data: {"error": e.toString()});
      return [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePVData(PV pvData) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      await updatePV.execute(pvData);
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Updated PV with ID: ${pvData.pvId}");
      await loadAllPVs(); // Refresh list after update
    } catch (e) {
      errorMessage = e.toString();
      await logger.log("ERROR",
          "Presentation Layer - Failed to update PV with ID: ${pvData.pvId}",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePVById(String pvId) async {
    isLoading = true;
    notifyListeners();

    final logger = (await AppLogger.getInstance()).logger;
    try {
      await deletePV.execute(pvId); // Call the DeletePV use case
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Deleted PV with ID: $pvId");
      await loadAllPVs(); // Refresh the list of PVs after deletion
    } catch (e) {
      errorMessage = e.toString();
      await logger.log(
          "ERROR", "Presentation Layer - Failed to delete PV with ID: $pvId",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // Dispose any resources like database connection if needed
    super.dispose();
  }

  // Fetch Monthly PV Counts
  Future<void> fetchMonthlyPVCounts() async {
    isLoading = true;
    final logger = (await AppLogger.getInstance()).logger;

    try {
      monthlyPVCounts = await MonthlyPVCounts.execute();
      errorMessage = null;
      await logger.log(
          "INFO", "Presentation Layer - Fetched monthly PV counts");
    } catch (e) {
      errorMessage = e.toString();
      monthlyPVCounts = []; // Reset to an empty list in case of error
      await logger.log(
          "ERROR", "Presentation Layer - Failed to fetch monthly PV counts",
          data: {"error": e.toString()});
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners after data fetch
    }
  }

  // Fetch Total PV Count
  Future<void> fetchTotalPVCount() async {
    isLoading = true;
    final logger = (await AppLogger.getInstance()).logger;

    try {
      totalPVCount = await TotalpVCount.execute();
      errorMessage = null;
      await logger.log("INFO", "Presentation Layer - Fetched total PV count");
      notifyListeners(); // Notify listeners after data fetch
    } catch (e) {
      errorMessage = e.toString();
      totalPVCount = 0;
      await logger.log(
          "ERROR", "Presentation Layer - Failed to fetch total PV count",
          data: {"error": e.toString()});
      notifyListeners(); // Notify listeners even on error
    } finally {
      isLoading = false;
    }
  }
}
