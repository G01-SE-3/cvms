/*
File Name: delete_inspector_use_case.dart
Purpose: Defines the business logic for deleting an inspector. It uses the repository to perform the deletion action.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';

class DeleteInspectorUseCase {
  final InspectorRepository repository;

  DeleteInspectorUseCase(this.repository);

  Future<void> call(InspectorEntity inspector) async {
    try {
      await repository.deleteInspector(inspector);
    } catch (e) {
      throw Exception('Failed to delete inspector: $e');
    }
  }
}
 