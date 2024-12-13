class InspectorEntity {
  final int inspectorNumber;
  final String name;
  final String surname;
  final int? badgeNumber; // Nullable
  final String assignedDepartment;
  final int? contactNumber; // Nullable

  InspectorEntity({
    required this.inspectorNumber,
    required this.name,
    required this.surname,
    this.badgeNumber, // Nullable
    required this.assignedDepartment,
    this.contactNumber, // Nullable
  });
}
