import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetPVsByNumber {
  final PVRepository pvRepository;

  GetPVsByNumber(this.pvRepository);

  Future<List<PV>> execute(int pvNumber) async {
    try {
        return await pvRepository.searchPV(pvNumber);
    } catch (e) {
      throw Exception("Failed to fetch PVs with pvNumber $pvNumber: $e");
    }
  }
}