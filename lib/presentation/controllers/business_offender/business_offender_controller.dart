import 'package:cvms/domain/usecases/business_offender/add_offender.dart';
import 'package:cvms/domain/usecases/business_offender/get_all_offenders.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:postgres/postgres.dart';
import 'package:cvms/data/datasources/database_connection.dart';

/*
class BusinessOffenderController {
  // Declare an instance of AddOffender use case
  final AddOffender addOffender;

  // Constructor for the controller that takes an AddOffender instance
  BusinessOffenderController(this.addOffender);

  // Function to create an offender by calling the AddOffender use case
  Future<void> createOffender(BusinessOffender offender) async {
    // Call the execute() function from AddOffender use case
    await addOffender.execute(offender);
  }

}

*/

class BusinessOffenderController_two {
  final BusinessOffenderRepository _repository;

  BusinessOffenderController_two(this._repository);

  Future<List<BusinessOffender>> fetchOffenders() async {
    return await _repository.fetchAllOffenders(); // Fetch the data from the repository
  }
}

class BusinessOffenderController {
  // PostgreSQL connection details
  //late PostgreSQLConnection _connection;
   late final DatabaseConnection _databaseConnection;

  // Open the connection to PostgreSQL database
  /*Future<void> openConnection() async {
    _connection = PostgreSQLConnection(
      'localhost', // Database host
      5432,        // Database port
      'your_database', // Database name
      username: 'your_username',  // Username
      password: 'your_password',  // Password
    );
    await _connection.open();
  }*/

  // Function to create an offender (save to PostgreSQL database)
  Future<void> createOffender(BusinessOffender offender) async {
     try {
      // Ensure the connection is open
      if (_databaseConnection.connection == null || _databaseConnection.connection!.isClosed) {
        await _databaseConnection.connect();
      }


      // Insert the offender's data into the database
      await _databaseConnection.connection!.query(
        '''
        INSERT INTO business_offender(
          business_name, name, surname, date_of_birth, place_of_birth, 
          birth_certificate_number, mother_name, mother_surname, 
          father_name, address, business_address
        ) VALUES (@business_name, @name, @surname, @date_of_birth, 
        @place_of_birth, @birth_certificate_number, @mother_name, 
        @mother_surname, @father_name, @address, @business_address)
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

      print("Offender saved: ${offender.business_name}");

    } catch (e) {
      print("Failed to add offender: $e");
      throw Exception("Failed to add offender: $e");
    }
  }

  // Close the connection after the operation
   Future<void> closeConnection() async {
    await _databaseConnection.close();
  }
}
