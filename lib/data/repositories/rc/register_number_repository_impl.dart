import 'package:cvms/domain/entities/rc/register_number_entity.dart';
import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import 'package:cvms/data/datasources/rc/register_number_datasource.dart';
import '../../models/rc/register_number_model.dart';

class RegisterNumberRepositoryImpl implements RegisterNumberRepository {
  final RegisterNumberDataSource _dataSource;

  RegisterNumberRepositoryImpl(this._dataSource);

  @override
  Future<void> insertRegisterNumber(RegisterNumberEntity registerNumber) async {
    try {
      await _dataSource.addRegisterNumber(RegisterNumber(
        registerNumber: registerNumber.registerNumber,
        individualOffenderId:
            registerNumber.individualOffenderId, // Handle potential null
        businessOffenderId:
            registerNumber.businessOffenderId, // Handle potential null
        commercialRegisterDate: registerNumber.commercialRegisterDate,
        editDate: registerNumber.editDate,
        cancellationDate: registerNumber.cancellationDate,
      ));
    } catch (e) {
      print("Error occurred while inserting register number: $e");
      throw Exception("Failed to insert register number: $e");
    }
  }

  @override
  Future<List<RegisterNumberEntity>> getRegisterNumbers() async {
    try {
      final registerNumbers = await _dataSource.fetchAllRegisterNumbers();
      return registerNumbers.map((registerNumber) {
        return RegisterNumberEntity(
          registerNumber: registerNumber.registerNumber,
          individualOffenderId: registerNumber.individualOffenderId,
          businessOffenderId: registerNumber.businessOffenderId,
          commercialRegisterDate: registerNumber.commercialRegisterDate,
          editDate: registerNumber.editDate,
          cancellationDate: registerNumber.cancellationDate,
        );
      }).toList();
    } catch (e) {
      print("Error occurred while fetching register numbers: $e");
      throw Exception("Failed to fetch register numbers: $e");
    }
  }

  @override
  Future<String> getBusinessRegisterNumberById(int id) async {
    try {
      final registerNumber =
          await _dataSource.fetchBusinessRegisterNumberById(id);
      return registerNumber!.registerNumber;
    } catch (e) {
      print("Error occurred while fetching register number by ID: $e");
      throw Exception("Failed to fetch register number by ID: $e");
    }
  }

  @override
  Future<String> getIndividualRegisterNumberById(int id) async {
    try {
      final registerNumber =
          await _dataSource.fetchIndividualRegisterNumberById(id);
      return registerNumber!.registerNumber;
    } catch (e) {
      print("Error occurred while fetching register number by ID: $e");
      throw Exception("Failed to fetch register number by ID: $e");
    }
  }

  @override
  Future<void> updateRegisterNumber(RegisterNumberEntity registerNumber) async {
    try {
      await _dataSource.updateRegisterNumber(
        RegisterNumber(
          registerNumber: registerNumber.registerNumber,
          individualOffenderId: registerNumber.individualOffenderId,
          businessOffenderId: registerNumber.businessOffenderId,
          commercialRegisterDate: registerNumber.commercialRegisterDate,
          editDate: registerNumber.editDate,
          cancellationDate: registerNumber.cancellationDate,
        ),
      );
    } catch (e) {
      print("Error occurred while updating register number: $e");
      throw Exception("Failed to update register number: $e");
    }
  }

  @override
  Future<void> deleteRegisterNumber(int registerNumber) async {
    try {
      await _dataSource.deleteRegisterNumber(registerNumber);
    } catch (e) {
      print("Error occurred while deleting register number: $e");
      throw Exception("Failed to delete register number: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> getOffenderByRC(
      String commercialRegisterNumber) async {
    try {
      final result =
          await _dataSource.getOffenderByRC(commercialRegisterNumber);
      return result;
    } catch (e) {
      print("Error occurred while fetching offender by RC: $e");
      throw Exception("Failed to fetch offender by RC: $e");
    }
  }
}
