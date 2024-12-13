import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetPVDetails {
  final PVRepository pvRepository;

  GetPVDetails(this.pvRepository);

  Future<PV?> execute(String pvId) async {
    try {
      return await pvRepository.getPVById(pvId);
    } catch (e) {
      throw Exception("Failed to fetch PV details: $e");
    }
  }
}
