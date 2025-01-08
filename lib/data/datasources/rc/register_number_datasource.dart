import 'package:cvms/data/models/rc/register_number_model.dart';
import '../database_helper.dart';

class RegisterNumberDataSource {


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

  Future<void> updateRegisterNumber( RegisterNumber registerNumber) async {
   
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

  
  
  Future<List<RegisterNumber>> fetchAllRegisterNumbers() async {
    final connection = await DatabaseHelper().connection;
    final results = await connection.query('SELECT * FROM rc');
    return results.map((row) {
      return RegisterNumber.fromJson(row.toColumnMap());
    }).toList();
  }



Future<RegisterNumber?> fetchBusinessRegisterNumberById(int id) async {
  try {
    final connection = await DatabaseHelper().connection;
    final result = await connection.query(
      'SELECT commercialregisternumber FROM rc WHERE business_id = @business_id',
      substitutionValues: {'business_id': id},
    );

    if (result.isNotEmpty) {
      print("Query result for ID $id: ${result.first.toColumnMap()}");
      final registerNumber = RegisterNumber.fromJson(result.first.toColumnMap());
      return registerNumber;
    } else {
      return null;
    }
  } catch (e) {
    print("Database error while fetching register number for ID $id: $e");
    return null;
  }
}

Future<RegisterNumber?> fetchIndividualRegisterNumberById(int id) async {
  try {
    final connection = await DatabaseHelper().connection;
    final result = await connection.query(
      'SELECT commercialregisternumber FROM rc WHERE individual_id = @individual_id',
      substitutionValues: {'individual_id': id},
    );

    if (result.isNotEmpty) {
      print("Query result for ID $id: ${result.first.toColumnMap()}");
      final registerNumber = RegisterNumber.fromJson(result.first.toColumnMap());
      return registerNumber;
    } else {
      return null;
    }
  } catch (e) {
    print("Database error while fetching register number for ID $id: $e");
    return null;
  }
}

}
