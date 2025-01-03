import 'package:postgres/postgres.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
abstract class IndividualOffenderrepository {
  //Future<List<IndividualOffender>> fetchAllOffenders();
  Future<void> addOffender(IndividualOffender offender);
}


class IndividualOffenderRepository {
  final PostgreSQLConnection connection;


  IndividualOffenderRepository(this.connection);

  Future<List<IndividualOffender>> fetchAllOffenders() async {
    // Connect to PostgreSQL
    await connection.open();
    
    // Fetch data from the PostgreSQL database
    List<List<dynamic>> results = await connection.query('''
      SELECT  name, surname, date_of_birth, address, business_address
      FROM individual_offender
    ''');

    // Convert results to a list of BusinessOffender objects
    List<IndividualOffender> offenders = results.map((row) {
  return IndividualOffender(
    individual_id: row[0] is int ? row[0] as int : int.parse(row[0] as String),  // Correctly cast to int
    name: row[2] as String,
    surname: row[3] as String,
    date_of_birth: row[4] as String,
    place_of_birth: row[5] as String,
    birth_certificate_number: row[6] as String,
    mother_name: row[7] as String,
    mother_surname: row[8] as String,
    father_name: row[9] as String,
    address: row[10] as String,
    business_address: row[11] as String,
  );
}).toList();


    // Close the connection
    await connection.close();

    return offenders;
  }
}


