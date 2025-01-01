import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class DeletePV {
  final PVRepository pvRepository;

  DeletePV(this.pvRepository);

  Future<void> execute(String pvId) async {
    try {
      await pvRepository.deletePV(pvId);
    } catch (e) {
      throw Exception("Failed to delete PV with ID $pvId: $e");
    }
  }
}
