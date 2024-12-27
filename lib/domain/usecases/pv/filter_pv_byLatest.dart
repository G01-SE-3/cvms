import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class GetLatestPVs {
  final PVRepository pvRepository;

  GetLatestPVs(this.pvRepository);

  Future<List<PV>> execute(int number) async {
    try {
      // Fetch the latest PVs from the repository
      return await pvRepository.filterByLatest(number);
    } catch (e) {
      throw Exception("Failed to fetch the latest $number PVs: $e");
    }
  }
}
