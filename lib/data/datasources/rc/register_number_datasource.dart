/*`File Name: <register_number_datasource.dart>
Purpose: 
- The purpose of this file is to manage the database operations for the registration numbers, 
including adding, updating, deleting, and fetching register numbers and their associated offender details.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/


import 'package:cvms/data/models/rc/register_number_model.dart';
import '../database_helper.dart';

class RegisterNumberDataSource {

/// Adds a new register number to the database.
/// This method is asynchronous and executes an SQL query to insert the new register number data.
/// 
/// Throws a [DatabaseException] if the insert operation fails.

  Future<void> addRegisterNumber(RegisterNumber registerNumber) async {
    print("datasource function running");
    final connection = await DatabaseHelper().connection;
    try {
      await connection.query(
        '''
        INSERT INTO rc 
        (commercialregisternumber, individual_id, business_id, commercialregisterdate, editdate, cancellationdate) 
        VALUES (@commercialregisternumber, @individual_id, @business_id, @commercialregisterdate, @editdate, @cancellationdate)
        ''',
        substitutionValues: {
          'commercialregisternumber': registerNumber.registerNumber,
          'individual_id': registerNumber.individualOffenderId,
          'business_id': registerNumber.businessOffenderId,
          'commercialregisterdate': registerNumber.commercialRegisterDate,
          'editdate': registerNumber.editDate,
          'cancellationdate': registerNumber.cancellationDate,
        },
      );
      print("Register number added successfully.");
    } catch (e) {
      print("Error adding register number: $e");
      rethrow;
    }
  }

/// Updates an existing register number in the database.
/// This method is asynchronous and executes an SQL query to update the register number details.
/// 
/// Throws a [DatabaseException] if the update operation fails.

  Future<void> updateRegisterNumber(RegisterNumber registerNumber) async {
    final connection = await DatabaseHelper().connection;
    try {
      await connection.query(
        '''
        UPDATE rc 
        SET commercialregisternumber = @CommercialRegisterNumber, 
            individual_id = @individual_id, 
            business_id = @business_id, 
            commercialregisterdate = @CommercialRegisterDate, 
            editdate = @EditDate, 
            cancellationdate = @CancellationDate
        WHERE CommercialRegisterNumber = @id
        ''',
        substitutionValues: {
          'commercialregisternumber': registerNumber.registerNumber,
          'individual_id': registerNumber.individualOffenderId,
          'business_id': registerNumber.businessOffenderId,
          'commercialregisterdate': registerNumber.commercialRegisterDate,
          'editdate': registerNumber.editDate,
          'cancellationdate': registerNumber.cancellationDate,
        },
      );
      print("Register number updated successfully.");
    } catch (e) {
      print("Error updating register number: $e");
      rethrow;
    }
  }

/// Deletes a register number from the database based on the given ID.
/// This method is asynchronous and executes an SQL query to remove the register number.
/// 
/// Throws a [DatabaseException] if the deletion operation fails or if the ID is invalid.
  
  Future<void> deleteRegisterNumber(int id) async {
    if (id <= 0) {
      print("Invalid register number ID.");
      return;
    }

    final connection = await DatabaseHelper().connection;
    try {
      await connection.query(
        'DELETE FROM rc WHERE CommercialRegisterNumber = @id',
        substitutionValues: {'id': id},
      );
      print("Register number deleted successfully.");
    } catch (e) {
      print("Error deleting register number: $e");
      rethrow;
    }
  }

/// Fetches all register numbers from the database.
/// This method is asynchronous and returns a list of [RegisterNumber] objects.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<List<RegisterNumber>> fetchAllRegisterNumbers() async {
    final connection = await DatabaseHelper().connection;
    final results = await connection.query('SELECT * FROM rc');
    return results.map((row) {
      return RegisterNumber.fromJson(row.toColumnMap());
    }).toList();
  }

/// Fetches a business's register number based on the given business ID.
/// This method is asynchronous and returns a [RegisterNumber] object if found, or null if not.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<RegisterNumber?> fetchBusinessRegisterNumberById(int id) async {
    try {
      final connection = await DatabaseHelper().connection;
      final result = await connection.query(
        'SELECT commercialregisternumber FROM rc WHERE business_id = @business_id',
        substitutionValues: {'business_id': id},
      );

      if (result.isNotEmpty) {
        print("Query result for ID $id: ${result.first.toColumnMap()}");
        final registerNumber =
            RegisterNumber.fromJson(result.first.toColumnMap());
        return registerNumber;
      } else {
        return null;
      }
    } catch (e) {
      print("Database error while fetching register number for ID $id: $e");
      return null;
    }
  }

/// Fetches an individual's register number based on the given individual ID.
/// This method is asynchronous and returns a [RegisterNumber] object if found, or null if not.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<RegisterNumber?> fetchIndividualRegisterNumberById(int id) async {
    try {
      final connection = await DatabaseHelper().connection;
      final result = await connection.query(
        'SELECT commercialregisternumber FROM rc WHERE individual_id = @individual_id',
        substitutionValues: {'individual_id': id},
      );

      if (result.isNotEmpty) {
        print("Query result for ID $id: ${result.first.toColumnMap()}");
        final registerNumber =
            RegisterNumber.fromJson(result.first.toColumnMap());
        return registerNumber;
      } else {
        return null;
      }
    } catch (e) {
      print("Database error while fetching register number for ID $id: $e");
      return null;
    }
  }

/// Fetches offender details based on the given commercial register number.
/// This method is asynchronous and returns a map containing offender information if found.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<Map<String, dynamic>> getOffenderByRC(
      String commercialRegisterNumber) async {
    try {
      final connection = await DatabaseHelper().connection;

      // Query to fetch offender details by commercial register number
      final result = await connection.query(
        '''
      SELECT 
        rc.commercialregisternumber,
        rc.individual_id,
        rc.business_id
      FROM rc
      WHERE rc.commercialregisternumber = @commercialRegisterNumber
      ''',
        substitutionValues: {
          'commercialRegisterNumber': commercialRegisterNumber
        },
      );

      if (result.isNotEmpty) {
        final row = result.first.toColumnMap();

        final offenderType = row['individual_id'] != null
            ? 'individual'
            : (row['business_id'] != null ? 'business' : null);
        final offenderNumber = row['individual_id'] ?? row['business_id'];

        return {
          'isExisting': 1,
          'offenderType': offenderType,
          'offenderNumber': offenderNumber,
        };
      } else {
        // Offender does not exist
        return {
          'isExisting': 0,
          'offenderType': null,
          'offenderNumber': null,
        };
      }
    } catch (e) {
      print(
          "Database error while fetching offender for RC $commercialRegisterNumber: $e");
      // You can decide whether to throw or return default values in case of an error.
      return {
        'isExisting': 0,
        'offenderType': null,
        'offenderNumber': null,
      };
    }
  }
}
