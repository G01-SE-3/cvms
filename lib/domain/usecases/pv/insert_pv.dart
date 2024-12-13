import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class InsertPV {
  final PVRepository pvRepository;

  InsertPV(this.pvRepository);

  Future<void> execute(PV pvData) async {
    try {
      // Call the repository method to insert the PV
      await pvRepository.insertPV(pvData);
    } catch (e) {
      throw Exception("Failed to insert PV: $e");
    }
  }
}
