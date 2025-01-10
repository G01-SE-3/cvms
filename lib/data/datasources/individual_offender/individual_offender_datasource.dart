/*
File Name: <individual_offender_datasource.dart>
Purpose: <Provides data access methods for managing individual offender records in the database.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/individual_offender/individual_offender_model.dart';
import '../database_helper.dart';

class IndividualOffenderDataSource {

//async function that fetch all offenders from the database and returns a list of offenders 
  Future<List<IndividualOffenderModel>> fetchAllIndividualOffenders() async {
    final connection = await DatabaseHelper().connection;
    final results = await connection.query('SELECT * FROM individual_offender');
    return results.map((row) {
      return IndividualOffenderModel.fromMap(row.toColumnMap());
    }).toList();
  }


//async function that fetch  offender by ID from the database and returns informations of that offender
  Future<IndividualOffenderModel?> fetchIndividualOffenderById(int id) async {
    if (id <= 0) {
      print("Invalid individual offender ID.");
      return null;
    }

    final connection = await DatabaseHelper().connection;
    final result = await connection.query(
      'SELECT * FROM individual_offender WHERE id = @id',
      substitutionValues: {'id': id},
    );

    if (result.isNotEmpty) {
      return IndividualOffenderModel.fromMap(result.first.toColumnMap());
    }
    print("Individual offender with ID $id not found.");
    return null;
  }
//async function that  add offenders to the database 
  Future<IndividualOffenderModel> addIndividualOffender(IndividualOffenderModel offender) async {
    
    print("function in datasource runing");
    final connection = await DatabaseHelper().connection;
    try {
      var result = await connection.query(
        '''
        INSERT INTO individual_offender 
        (name, surname, date_of_birth, place_of_birth, birth_certificate_number, 
         mother_name, mother_surname, father_name, address, business_address) 
        VALUES (@name, @surname, @date_of_birth, @place_of_birth, @birth_certificate_number, 
                @mother_name, @mother_surname, @father_name, @address, @business_address)
        RETURNING individual_id

        ''',
        substitutionValues: {
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

      if (result.isEmpty) {
      print("No data returned from query.");
      throw Exception("No data returned from query.");
    }

      int individualId = result.first[0]; 

      var addedOffender = IndividualOffenderModel(
        individual_id: individualId, 
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
      print("Individual offender added successfully.");
      return addedOffender;

    } catch (e) {
      print("Error adding individual offender: $e");
      rethrow;
    }
  }

//async function that updates  offender informatiosn in the database 
  Future<void> updateIndividualOffender(int id, IndividualOffenderModel offender) async {
    if (id <= 0 || offender.name.isEmpty) {
      print("Cannot update individual offender. Invalid ID or required fields are empty.");
      return;
    }

    final connection = await DatabaseHelper().connection;
    try {
      await connection.query(
        '''
        UPDATE individual_offender 
        SET name = @name, surname = @surname, date_of_birth = @date_of_birth, 
            place_of_birth = @place_of_birth, birth_certificate_number = @birth_certificate_number, 
            mother_name = @mother_name, mother_surname = @mother_surname, 
            father_name = @father_name, address = @address, 
            business_address = @business_address
        WHERE id = @id
        ''',
        substitutionValues: {...offender.toMap(), 'id': id},
      );
      print("Individual offender updated successfully.");
    } catch (e) {
      print("Error updating individual offender: $e");
      rethrow;
    }
  }
//async function that delete  offender informations  in the database  
  Future<void> deleteIndividualOffender(int id) async {
    if (id <= 0) {
      print("Invalid individual offender ID.");
      return;
    }

    final connection = await DatabaseHelper().connection;
    try {
      await connection.query(
        'DELETE FROM individual_offender WHERE individual_id = @individual_id',
        substitutionValues: {'id': id},
      );
      print("Individual offender deleted successfully.");
    } catch (e) {
      print("Error deleting individual offender: $e");
      rethrow;
    }
  }
}
