import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetMonthlyPVCounts {
  final PVRepository pvRepository;

  GetMonthlyPVCounts(this.pvRepository);

  Future<List<int>> execute() async {
    try {
      
      return await pvRepository.getMonthlyPVCounts();
    } catch (e) {
      throw Exception("Failed to fetch monthly PV counts: $e");
    }
  }
}
