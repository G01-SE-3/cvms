import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import '../database_helper.dart';

class BusinessOffenderDataSource {

Future<List<BusinessOffenderModel>> fetchAllOffenders() async {
  final connection = await DatabaseHelper().connection;
  final results = await connection.query('SELECT * FROM business_offender');
  return results.map((row) {
    return BusinessOffenderModel.fromMap(row.toColumnMap());
  }).toList();
}


  Future<BusinessOffenderModel?> fetchOffenderById(int id) async {
    if (id <= 0) {
      print("Invalid offender ID.");
      return null;
    }

    final connection = await DatabaseHelper().connection; 
    final result = await connection.query(
      'SELECT * FROM business_offender WHERE business_id = @id',
      substitutionValues: {'id': id},
    );

    if (result.isNotEmpty) {
      return BusinessOffenderModel.fromMap(result.first.toColumnMap());
    }
    print("Offender with ID $id not found.");
    return null;
  }

Future<BusinessOffenderModel> addOffender(BusinessOffenderModel offender) async {
  final connection = await DatabaseHelper().connection;
  try {
    var result = await connection.query(
      '''
      INSERT INTO business_offender 
      (business_name, name, surname, date_of_birth, place_of_birth, birth_certificate_number, 
       mother_name, mother_surname, father_name, address, business_address) 
      VALUES (@business_name, @name, @surname, @date_of_birth, @place_of_birth, @birth_certificate_number, 
              @mother_name, @mother_surname, @father_name, @address, @business_address)
      RETURNING business_id
      ''',
      substitutionValues: {
        'business_name': offender.business_name,
        'name': offender.name,
        'surname': offender.surname,
        'date_of_birth': offender.date_of_birth,
        'place_of_birth': offender.place_of_birth,
        'birth_certificate_number': offender.birth_certificate_number,
        'mother_name': offender.mother_name,
        'mother_surname': offender.mother_surname,
        'father_name': offender.father_name,
        'address': offender.address,
        'business_address': offender.business_address,
      },
    );

    int businessId = result.first[0]; 

    var addedOffender = BusinessOffenderModel(
      business_id: businessId, 
      business_name: offender.business_name,
      name: offender.name,
      surname: offender.surname,
      date_of_birth: offender.date_of_birth,
      place_of_birth: offender.place_of_birth,
      birth_certificate_number: offender.birth_certificate_number,
      mother_name: offender.mother_name,
      mother_surname: offender.mother_surname,
      father_name: offender.father_name,
      address: offender.address,
      business_address: offender.business_address,
    );

    print("Offender added successfully.");
    return addedOffender;
  } catch (e) {
    print("Error adding offender: $e");
    rethrow;
  }
}



  Future<void> updateOffender(int id, BusinessOffenderModel offender) async {
    if (id <= 0 || offender.name.isEmpty) {
      print("Cannot update offender. Invalid ID or required fields are empty.");
      return;
    }

    final connection = await DatabaseHelper().connection; 
    try {
      await connection.query(
        '''
        UPDATE business_offender 
        SET business_name = @business_name, name = @name, surname = @surname, 
            date_of_birth = @date_of_birth, place_of_birth = @place_of_birth, 
            birth_certificate_number = @birth_certificate_number, mother_name = @mother_name, 
            mother_surname = @mother_surname, father_name = @father_name, 
            address = @address, business_address = @business_address 
        WHERE business_id = @id
        ''',
        substitutionValues: {...offender.toMap(), 'id': id},
      );
      print("Offender updated successfully.");
    } catch (e) {
      print("Error updating offender: $e");
      rethrow;
    }
  }

  Future<void> deleteOffender(int id) async {
    if (id <= 0) {
      print("Invalid offender ID.");
      return;
    }

    final connection = await DatabaseHelper().connection; 
    try {
      await connection.query(
        'DELETE FROM business_offender WHERE business_id = @id',
        substitutionValues: {'id': id},
      );
      print("Offender deleted successfully.");
    } catch (e) {
      print("Error deleting offender: $e");
      rethrow;
    }
  }
}
