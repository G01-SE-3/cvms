/*`File Name: <register_number_repository_impl.dart>
Purpose: 
- The purpose of this file is to manage the communication between the data source and the application logic for handling register numbers
for mapping data between objects and the database.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/rc/register_number_entity.dart';
import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import 'package:cvms/data/datasources/rc/register_number_datasource.dart';
import '../../models/rc/register_number_model.dart';

class RegisterNumberRepositoryImpl implements RegisterNumberRepository {
  final RegisterNumberDataSource _dataSource;

  RegisterNumberRepositoryImpl(this._dataSource);

/// Inserts a new register number into the data source.
/// This method is asynchronous and performs the necessary data transformation 
/// between the entity and the model before calling the data source.
/// 
/// Throws an [DatabaseException] if the insert operation fails.

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

/// Fetches all register numbers from the data source.
/// This method is asynchronous and returns a list of [RegisterNumberEntity] objects.
/// 
/// Throws an [DatabaseException] if the fetch operation fails.

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

/// Fetches the business register number from the data source by ID.
/// This method is asynchronous and returns the register number as a string.
/// 
/// Throws an [DatabaseException] if the fetch operation fails.

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

/// Fetches the individual register number from the data source by ID.
/// This method is asynchronous and returns the register number as a string.
/// 
/// Throws an [DatabaseException] if the fetch operation fails.

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

/// Updates an existing register number in the data source.
/// This method is asynchronous and performs the necessary data transformation 
/// between the entity and the model before calling the data source.
/// 
/// Throws an [DatabaseException] if the update operation fails.

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

/// Deletes a register number from the data source.
/// This method is asynchronous and deletes the register number by its ID.
/// 
/// Throws an [DatabaseException] if the delete operation fails.

  @override
  Future<void> deleteRegisterNumber(int registerNumber) async {
    try {
      await _dataSource.deleteRegisterNumber(registerNumber);
    } catch (e) {
      print("Error occurred while deleting register number: $e");
      throw Exception("Failed to delete register number: $e");
    }
  }

/// Fetches offender details by commercial register number from the data source.
/// This method is asynchronous and returns a map of offender details.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

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
