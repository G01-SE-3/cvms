/*
File Name: inspector_repository.dart
Purpose: Defines the abstract repository interface for Inspector-related operations, including methods for fetching, adding, updating, and deleting inspector entities.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/inspector/inspector.dart';

abstract class InspectorRepository {
  Future<List<InspectorEntity>> getAllInspectors();
  Future<InspectorEntity?> getInspectorById(int id);
  Future<void> addInspector(InspectorEntity inspector);
  Future<void> updateInspector(InspectorEntity inspector); 
  Future<void> deleteInspector(InspectorEntity inspector);  
}
