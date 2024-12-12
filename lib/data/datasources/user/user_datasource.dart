/*
import 'package:postgres/postgres.dart';

class UserDataSource {
  final PostgreSQLConnection connection;

  UserDataSource(this.connection);

  Future<Map<String, dynamic>> fetchUserById(int id) async {
    final result = await connection.mappedResultsQuery(
      'SELECT id, username, email, hashed_password FROM users WHERE id = @id',
      substitutionValues: {'id': id},
    );
    return result.isNotEmpty ? result.first['users'] : {};
  }

  Future<void> addUser(Map<String, dynamic> data) async {
    await connection.query(
      '''
      INSERT INTO users (username, email, hashed_password) 
      VALUES (@username, @email, @hashedPassword)
      ''',
      substitutionValues: data,
    );
  }
}
*/
