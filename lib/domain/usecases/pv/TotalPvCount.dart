import 'package:cvms/domain/repositories/pv/pv_repository.dart';

class TotalPVCount {
  final PVRepository pvRepository;

  TotalPVCount(this.pvRepository);

  Future<int> execute() async {
    try {
      // Call repository to get the total PV count
      return await pvRepository.getTotalPVCount();
    } catch (e) {
      throw Exception("Failed to fetch total PV count: $e");
    }
  }
}
