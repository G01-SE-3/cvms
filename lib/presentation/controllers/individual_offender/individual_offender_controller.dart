/*import 'package:cvms/domain/usecases/individual_offender/add_offender.dart';
import 'package:cvms/domain/usecases/individual_offender/get_all_offenders.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:postgres/postgres.dart';


/*
class IndividualOffenderController {
  // Declare an instance of AddOffender use case
  final AddOffender addOffender;

  // Constructor for the controller that takes an AddOffender instance
  IndividualOffenderController(this.addOffender);

  // Function to create an offender by calling the AddOffender use case
  Future<void> createOffender(IndividualOffender offender) async {
    // Call the execute() function from AddOffender use case
    await addOffender.execute(offender);
  }

}

*/


class IndividualOffenderController_two{
  final GetAllOffenders _getAllOffenders;

  IndividualOffenderController_two(this._getAllOffenders);

  // Method that fetches the offenders
  Future<List<IndividualOffender>> fetchOffenders() async {
    return await _getAllOffenders.execute(); // Assuming execute() method fetches the data
  }
}

class IndividualOffenderController {
  // PostgreSQL connection details
  late PostgreSQLConnection _connection;

  // Open the connection to PostgreSQL database
  Future<void> openConnection() async {
    _connection = PostgreSQLConnection(
      'localhost', // Database host
      5432,        // Database port
      'your_database', // Database name
      username: 'your_username',  // Username
      password: 'your_password',  // Password
    );
    await _connection.open();
  }

  // Function to create an offender (save to PostgreSQL database)
  Future<void> createOffender(IndividualOffender offender) async {
    try {
      // Open the connection if not already open
      if (_connection.isClosed) {
        await openConnection();
      }

      // Insert the offender's data into the database
      await _connection.query(
        '''
        INSERT INTO individual_offender(
          name, surname, date_of_birth, place_of_birth, 
          birth_certificate_number, mother_name, mother_surname, 
          father_name, address, business_address
        ) VALUES (@name, @surname, @date_of_birth, 
        @place_of_birth, @birth_certificate_number, @mother_name, 
        @mother_surname, @father_name, @address, @business_address)
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

      print("Offender saved: ${offender.name}");

    } catch (e) {
      print("Failed to add offender: $e");
      throw Exception("Failed to add offender: $e");
    }
  }

  // Close the connection after the operation
  Future<void> closeConnection() async {
    if (!_connection.isClosed) {
      await _connection.close();
    }
  }
}
*/