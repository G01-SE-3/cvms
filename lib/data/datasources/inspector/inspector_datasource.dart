/*
File Name: inspector_datasource.dart
Purpose: Handles the data operations related to the inspector entity, including fetching, adding, updating, and deleting inspector records from the database.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import '../../models/inspector/inspector_model.dart';
import '../database_helper.dart';

class InspectorDatasource {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<InspectorModel>> fetchAllInspectors() async {
    final connection = await _dbHelper.connection;
    final results = await connection.query('SELECT * FROM inspector');
    List<InspectorModel> inspectors = [];
    for (var row in results) {
      inspectors.add(InspectorModel.fromMap(row.toColumnMap()));
    }
    return inspectors;
  }

  Future<InspectorModel?> fetchInspectorById(int id) async {
    final connection = await _dbHelper.connection;
    final results = await connection.query(
        'SELECT * FROM inspector WHERE inspector_id = @id',
        substitutionValues: {'id': id});
    if (results.isEmpty) return null;
    return InspectorModel.fromMap(results.first.toColumnMap());
  }

  Future<void> addInspector(InspectorModel inspector) async {
    final connection = await _dbHelper.connection;
    await connection.query(
        'INSERT INTO inspector (name, surname, badge_number, assigned_department, contact_number) VALUES (@name, @surname, @badge_number, @assigned_department, @contact_number)',
        substitutionValues: {
          'name': inspector.name,
          'surname': inspector.surname,
          'badge_number': inspector.badgeNumber,
          'assigned_department': inspector.assignedDepartment,
          'contact_number': inspector.contactNumber
        });
  }

  Future<void> updateInspector(InspectorModel inspector) async {
    final connection = await _dbHelper.connection;
    await connection.query(
        'UPDATE inspector SET name = @name, surname = @surname, badge_number = @badge_number, assigned_department = @assigned_department, contact_number = @contact_number WHERE inspector_id = @id',
        substitutionValues: {
          'name': inspector.name,
          'surname': inspector.surname,
          'badge_number': inspector.badgeNumber,
          'assigned_department': inspector.assignedDepartment,
          'contact_number': inspector.contactNumber,
          'id': inspector.id
        });
  }

  Future<void> deleteInspector(int id) async {
    final connection = await _dbHelper.connection;
    await connection.query('DELETE FROM inspector WHERE inspector_id = @id',
        substitutionValues: {'id': id});
  }
}
