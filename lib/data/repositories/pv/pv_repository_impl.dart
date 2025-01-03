import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class PVRepositoryImpl implements PVRepository {
  final PVDataSource dataSource;

  PVRepositoryImpl(this.dataSource);

  @override
  Future<PV?> getPVById(String pvId) async {
    try {
      // Call data source to get PV details
      final pvModel = await dataSource.getPVDetails(pvId);
      if (pvModel == null) {
        throw Exception("PV not found");
      }
      // Return the entity converted from the model
      return pvModel.toEntity();
    } catch (e) {
      // Handle errors (e.g., data fetching issues, no data found)
      print("Failed to fetch PV by ID: $e");
      rethrow;
    }
  }

  @override
  Future<List<PV>> getAllPVs() async {
    try {
      // Call data source to fetch all PVs
      final pvModels = await dataSource.getAllPVs();

      // Convert the list of models to a list of entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., data fetching issues)
      print("Failed to fetch all PVs: $e");
      rethrow;
    }
  }

  @override
  Future<void> insertPV(PV pvEntity) async {
    try {
      // Convert the entity to a model
      final pvModel = pvEntity.toModel();

      // Begin transaction
      await dataSource.insertPV(
          pvModel); // This method should handle inserting PV and related data in the datasource
    } catch (e) {
      // Handle errors (e.g., database insertion issues)
      print("Failed to insert PV: $e");
      rethrow;
    }
  }

  @override
  Future<List<PV>> searchPV(int pvNumber) async {
    try {
      // Fetch PVs with the specific pvNumber from the data source
      final pvModels = await dataSource.searchPV(pvNumber);

      // Convert the list of models to a list of entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., data fetching issues)
      print("Failed to fetch PVs with pvNumber $pvNumber: $e");
      rethrow;
    }
  }

  @override
  Future<List<PV>> filterByLatest(int number) async {
    try {
      // Fetch the latest PVs from the data source
      final pvModels = await dataSource.filterByLatest(number);

      // Convert the list of models to a list of entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., data fetching issues)
      print("Failed to fetch the latest $number PVs: $e");
      rethrow;
    }
  }

  @override
  Future<List<PV>> filterByDate(DateTime startDate, DateTime endDate) async {
    try {
      // Fetch PVs within the date range from the data source
      final pvModels = await dataSource.filterByDate(startDate, endDate);

      // Convert the list of models to a list of entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Handle errors (e.g., data fetching issues)
      print("Failed to fetch PVs between $startDate and $endDate: $e");
      rethrow;
    }
  }

  @override
  Future<void> updatePV(PV pvEntity) async {
    try {
      final pvModel = pvEntity.toModel();

      await dataSource.updatePV(pvModel);
    } catch (e) {
      print("Failed to update PV: $e");
      rethrow;
    }
  }

  @override
  Future<void> deletePV(String pvId) async {
    try {
      await dataSource.deletePV(pvId);
      print("PV with ID $pvId deleted successfully.");
    } catch (e) {
      print("Failed to delete PV with ID $pvId: $e");
      rethrow;
    }
  }

  @override
Future<List<int>> getMonthlyPVCounts() async {
  try {
    // Call data source to get the monthly PV counts
    final monthlyPVCounts = await dataSource.getMonthlyPVCounts();
    if (monthlyPVCounts.isEmpty) {
      throw Exception("No PV data found for the current year.");
    }
    // Return the monthly counts list
    return monthlyPVCounts;
  } catch (e) {
    // Handle errors (e.g., data fetching issues, no data found)
    print("Failed to fetch monthly PV counts: $e");
    rethrow;
  }
}
@override
  Future<int> getTotalPVCount() async {
    try {
      // Call data source to get the total PV count
      final totalPVCount = await dataSource.getTotalPVCount();

      if (totalPVCount == 0) {
        throw Exception("No PV data found.");
      }

      // Return the total PV count
      return totalPVCount;
    } catch (e) {
      // Handle errors (e.g., data fetching issues, no data found)
      print("Failed to fetch total PV count: $e");
      rethrow;
    }
  }
}
