/*
File Name: get_all_inspectors.dart
Purpose: Defines the business logic for retrieving all inspectors. It calls the repository method to fetch the list of inspectors.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import '/../domain/repositories/inspector/inspector_repository.dart';
import '../../entities/inspector/inspector.dart';

class GetAllInspectors {
  final InspectorRepository repository;

  GetAllInspectors(this.repository);

  Future<List<InspectorEntity>> execute() async {
    return await repository.getAllInspectors();
  }
}
