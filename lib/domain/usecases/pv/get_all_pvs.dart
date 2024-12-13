import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetAllPVs {
  final PVRepository pvRepository;

  GetAllPVs(this.pvRepository);

  Future<List<PV>> execute() async {
    try {
      return await pvRepository.getAllPVs();
    } catch (e) {
      throw Exception("Failed to fetch all PVs: $e");
    }
  }
}
