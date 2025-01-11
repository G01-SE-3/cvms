/*
File Name: inspector_model.dart
Purpose: Defines the data model for an inspector, including methods to convert from/to database maps and transform to/from the domain entity.
Authors: 
- Manar BENTAYEB [manar.bentayeb@ensia.edu.dz]

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/inspector/inspector.dart';

class InspectorModel {
  final int? id;
  final String name;
  final String surname;
  final int? badgeNumber;
  final String? assignedDepartment; 
  final int? contactNumber; 

  InspectorModel({
    this.id,
    required this.name,
    required this.surname,
    this.badgeNumber,
    this.assignedDepartment, 
    this.contactNumber, 
  });

  factory InspectorModel.fromMap(Map<String, dynamic> map) {
    return InspectorModel(
      id: map['inspector_id'],
      name: map['name'] ?? 'Default Name',
      surname: map['surname'] ?? 'Default Surname',
      badgeNumber: map['badge_number'] != null
          ? int.tryParse(map['badge_number'].toString())
          : null,
      assignedDepartment: map['assigned_department'],
      contactNumber: map['contact_number'] != null
          ? int.tryParse(map['contact_number'].toString())
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'inspector_id': id,
      'name': name,
      'surname': surname,
      'badge_number': badgeNumber,
      'assigned_department': assignedDepartment,
      'contact_number': contactNumber,
    };
  }

  InspectorEntity toEntity() {
    return InspectorEntity(
      name: name,
      inspectorNumber: id!,
      surname: surname,
      badgeNumber: badgeNumber!,
      assignedDepartment: assignedDepartment!,
      contactNumber: contactNumber!,
    );
  }
}
