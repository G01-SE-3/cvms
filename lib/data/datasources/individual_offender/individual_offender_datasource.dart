/*
import 'package:postgres/postgres.dart';

class IndividualOffenderDataSource {
  final PostgreSQLConnection connection;

  IndividualOffenderDataSource(this.connection);

  Future<List<Map<String, dynamic>>> fetchAllOffenders() async {
    return await connection.mappedResultsQuery('SELECT * FROM individual_offenders');
  }

  Future<void> addOffender(Map<String, dynamic> data) async {
    await connection.query(
      '''
      INSERT INTO individual_offenders 
      (name, surname, date_of_birth, place_of_birth, birth_certificate_number, mother_name, mother_surname, father_name, address, business_address) 
      VALUES (@name, @surname, @dateOfBirth, @placeOfBirth, @birthCertificateNumber, @motherName, @motherSurname, @fatherName, @address, @businessAddress)
      ''',
      substitutionValues: data,
    );
  }


  /* ADD ALL THE NEEDED FUNCTIONS */
  // getOffenderById
  // updateOffender
  // etc...


}


*/