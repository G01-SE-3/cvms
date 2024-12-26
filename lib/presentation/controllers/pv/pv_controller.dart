import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/search_pv.dart';

class PVController extends ChangeNotifier {
  final GetPVDetails getPVDetails;
  final GetAllPVs getAllPVs;
  final InsertPV insertPV;
  final GetPVsByNumber searchPV;

  PV? pv;
  List<PV> allPVs = [];
  List<PV> searchResults = []; 
  bool isLoading = false;
  String? errorMessage;

  PVController(
      {required this.getPVDetails,
      required this.getAllPVs,
      required this.insertPV,
      required this.searchPV});

  Future<void> loadPV(String pvId) async {
    if (pv != null) return;
    isLoading = true;
    notifyListeners();

    try {
      pv = await getPVDetails.execute(pvId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      pv = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAllPVs() async {
    isLoading = true;
    notifyListeners();

    try {
      allPVs = await getAllPVs.execute();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      allPVs = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Method for inserting a new PV
  Future<void> insertPVData(PV pvData) async {
    isLoading = true;
    notifyListeners();

    try {
      // Calling the insert use case to insert the PV into the database
      await insertPV.execute(pvData);
      errorMessage = null;
      // Optionally, you can reload the list of PVs after insertion
      await loadAllPVs(); // Refresh list after insert (or load specific PV)
    } catch (e) {
      errorMessage = e.toString();
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

  @override
  void dispose() {
    // Dispose any resources like database connection if needed
    super.dispose();
  }

  Future<List<PV>> searchPVsByNumber(int pvNumber) async {
  isLoading = true;
  notifyListeners();

  try {
    // Assuming the search logic in the use case returns the list of PVs
    searchResults = await searchPV.execute(pvNumber);
    errorMessage = null;
    return searchResults;  // Return the list of PVs
  } catch (e) {
    errorMessage = e.toString();
    searchResults = [];
    return [];  // Return an empty list in case of error
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
}
