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
    final pvModels = await dataSource. searchPV(pvNumber) ;

    // Convert the list of models to a list of entities
    return pvModels.map((model) => model.toEntity()).toList();
  } catch (e) {
    // Handle errors (e.g., data fetching issues)
    print("Failed to fetch PVs with pvNumber $pvNumber: $e");
    rethrow;
  }
}
}
