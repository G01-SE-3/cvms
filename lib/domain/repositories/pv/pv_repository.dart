import 'package:cvms/domain/entities/pv/pv.dart';

abstract class PVRepository {
  Future<PV?> getPVById(String pvId);
  Future<List<PV>> getAllPVs();
  Future<void> insertPV(PV pvEntity);
}
