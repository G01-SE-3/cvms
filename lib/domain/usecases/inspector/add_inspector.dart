/*
File Name: add_inspector.dart
Purpose: Defines the business logic for adding a new inspector. It converts an InspectorModel to an InspectorEntity and passes it to the repository for persistence.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/data/models/inspector/inspector_model.dart';
import '/../domain/repositories/inspector/inspector_repository.dart';
import '/../domain/entities/inspector/inspector.dart';

class AddInspector {
  final InspectorRepository inspectorRepository;

  AddInspector({required this.inspectorRepository});

  Future<void> call(InspectorModel inspectorModel) async {

    final inspectorEntity = InspectorEntity(
      inspectorNumber: inspectorModel.id ?? 0, 
      name: inspectorModel.name, 
      surname: inspectorModel.surname, 
      badgeNumber: inspectorModel.badgeNumber, 
      assignedDepartment: inspectorModel.assignedDepartment ?? 'Unknown', 
      contactNumber: inspectorModel.contactNumber != null
          ? int.tryParse(inspectorModel.contactNumber.toString()) 
          : null, 
    );

    await inspectorRepository.addInspector(inspectorEntity);
  }
}
