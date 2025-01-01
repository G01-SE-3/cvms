import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class UpdatePV {
  final PVRepository pvRepository;

  UpdatePV(this.pvRepository);

  Future<void> execute(PV pvData) async {
    try {
      await pvRepository.updatePV(pvData);
    } catch (e) {
      throw Exception("Failed to update PV: $e");
    }
  }
}
