import '/data/datasources/database_connection.dart';

Future<DatabaseConnection> getDatabaseConnection() async {
  final dbConnection = DatabaseConnection();
  await dbConnection.connect();
  return dbConnection;
}
