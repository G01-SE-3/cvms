import 'package:cvms/data/models/inspector/inspector_model.dart';

class InspectorEntity {
  final int inspectorNumber;
  final String name;
  final String surname;
  final int? badgeNumber;
  final String assignedDepartment;
  final int? contactNumber;

  InspectorEntity({
    required this.inspectorNumber,
    required this.name,
    required this.surname,
    this.badgeNumber,
    required this.assignedDepartment,
    this.contactNumber,
  });

  InspectorModel toModel() {
    return InspectorModel(
      name: name,
      id: inspectorNumber,
      surname: surname,
      badgeNumber: badgeNumber,
      assignedDepartment: assignedDepartment,
      contactNumber: contactNumber,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InspectorEntity && other.inspectorNumber == inspectorNumber;
  }

  @override
  int get hashCode => inspectorNumber.hashCode;
}
