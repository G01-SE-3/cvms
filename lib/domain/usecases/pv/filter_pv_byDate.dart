import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetPVsByDate {
  final PVRepository pvRepository;

  GetPVsByDate(this.pvRepository);

  Future<List<PV>> execute(DateTime startDate, DateTime endDate) async {
    try {
      
      return await pvRepository.filterByDate(startDate, endDate);
    } catch (e) {
      throw Exception("Failed to fetch PVs between $startDate and $endDate: $e");
    }
  }
}
