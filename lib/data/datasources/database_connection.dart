import 'package:postgres/postgres.dart';
import 'config_loader.dart';

class DatabaseConnection {
  PostgreSQLConnection? connection;
  final ConfigLoader _configLoader = ConfigLoader();

  Future<void> connect() async {
    try {
      final config = await _configLoader.loadConfig();

      connection = PostgreSQLConnection(
        config['db_host'],
        config['db_port'],
        config['db_name'],
        username: config['db_user'],
        password: config['db_password'],
      );

      await connection!.open();
      print("Database connected successfully!");
    } catch (e) {
      print("Database connection failed: $e");
      connection = null;
    }
  }

  Future<void> close() async {
    try {
      if (connection != null && !connection!.isClosed) {
        await connection!.close();
        print("Database connection closed.");
      } else {
        print("No connection to close.");
      }
    } catch (e) {
      print("Error while closing the database: $e");
    }
  }
}
