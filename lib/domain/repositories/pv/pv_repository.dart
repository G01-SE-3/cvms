import 'package:cvms/domain/entities/pv/pv.dart';

abstract class PVRepository {
  Future<PV?> getPVById(String pvId);
  Future<List<PV>> getAllPVs();
  Future<void> insertPV(PV pvEntity);
  Future<List<PV>>searchPV(int pvnumber);
  Future<List<PV>>filterByLatest(int number);
  Future<List<PV>>filterByDate(DateTime startDate, DateTime endDate);
  
}
