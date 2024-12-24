/*import 'package:postgres/postgres.dart';
import 'package:cvms/data/models/individual_offender/individual_offender_model.dart';
class IndividualOffenderDataSource {
  final PostgreSQLConnection connection;

  IndividualOffenderDataSource(this.connection);

  Future<List<Map<String, dynamic>>> fetchAllOffenders() async {
    return await connection.mappedResultsQuery('SELECT * FROM individual_offender');
  }

  Future<void> addOffender(IndividualOffenderModel offender) async {
  await connection.query(
    '''
    INSERT INTO individual_offender 
    (name, surname, date_of_birth, place_of_birth, birth_certificate_number, mother_name, mother_surname, father_name, address, business_address) 
    VALUES (@name, @surname, @date_of_birth, @place_of_birth, @birth_certificate_number, @mother_name, @mother_surname, @father_name, @address, @business_address)
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
}




   Future<PostgreSQLResultRow?> getOffenderById(int id) async {
    var result = await connection.query(
      'SELECT * FROM individual_offender WHERE id = @id',
      substitutionValues: {'id': id},
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> updateOffender(int id, Map<String, dynamic> data) async {
    await connection.query(
      '''
      UPDATE individual_offender
      SET name = @name, surname = @surname, commercial_register_number = @commercialRegisterNumber, 
          commercial_register_date = @commercialRegisterDate, edit_date = @editDate, cancellation_date = @cancellationDate, 
          date_of_birth = @dob, birth_certificate_number = @birthCertificateNumber, mother_name = @motherName, 
          mother_surname = @motherSurname, father_name = @fatherName, address = @address, business_address = @businessAddress
      WHERE id = @id
      ''',
      substitutionValues: {...data, 'id': id},
    );
  }



}*/