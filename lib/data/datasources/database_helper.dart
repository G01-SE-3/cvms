/*
File Name: database_helper.dart
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:postgres/postgres.dart';
import 'config_loader.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  PostgreSQLConnection? _connection;
  final ConfigLoader _configLoader = ConfigLoader();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<PostgreSQLConnection> get connection async {
    if (_connection == null || _connection!.isClosed) {
      final config = await _configLoader.loadConfig();

      try {
        _connection = PostgreSQLConnection(
          config['db_host'],
          config['db_port'],
          config['db_name'],
          username: config['db_user'],
          password: config['db_password'],
        );

        await _connection!.open();
        print("Database connected successfully!");
      } catch (e) {
        print("Database connection failed: $e");
        _connection = null;
      }
    }
    return _connection!;
  }

  Future<void> close() async {
    if (_connection != null && !_connection!.isClosed) {
      try {
        await _connection!.close();
        print("Database connection closed.");
      } catch (e) {
        print("Error while closing the database: $e");
      }
    } else {
      print("No active connection to close.");
    }
  }
}
