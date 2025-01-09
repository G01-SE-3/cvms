import 'package:cvms/domain/entities/rc/register_number_entity.dart';

abstract class RegisterNumberRepository {
  Future<void> insertRegisterNumber(RegisterNumberEntity registerNumber);
  Future<List<RegisterNumberEntity>> getRegisterNumbers();
  Future<String> getBusinessRegisterNumberById(int id);
  Future<String> getIndividualRegisterNumberById(int id);
  Future<void> updateRegisterNumber(RegisterNumberEntity registerNumber);
  Future<void> deleteRegisterNumber(int id);
}
