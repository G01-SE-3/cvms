/*
File Name: get_db.dart
Purpose: This file contains the implementation of getDatabaseConnection(),
that establishes and returns a database connection for the application by initializing and connecting to the database.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import '/data/datasources/database_connection.dart';

Future<DatabaseConnection> getDatabaseConnection() async {
  final dbConnection = DatabaseConnection();
  await dbConnection.connect();
  return dbConnection;
}
