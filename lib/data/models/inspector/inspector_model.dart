class InspectorModel {
  final int? id;
  final String name;
  final String surname;
  final int? badgeNumber;
  final String? assignedDepartment; // Change to nullable String?
  final int? contactNumber; // Nullable int?

  InspectorModel({
    this.id,
    required this.name,
    required this.surname,
    this.badgeNumber,
    this.assignedDepartment, // Nullable
    this.contactNumber, // Nullable
  });

  factory InspectorModel.fromMap(Map<String, dynamic> map) {
    return InspectorModel(
      id: map['inspector_id'],
      name: map['name'] ?? 'Default Name', // Default value
      surname: map['surname'] ?? 'Default Surname', // Default value
      badgeNumber: map['badge_number'] != null ? int.tryParse(map['badge_number'].toString()) : null, // Nullable int
      assignedDepartment: map['assigned_department'], // Nullable String (may be null)
      contactNumber: map['contact_number'] != null
          ? int.tryParse(map['contact_number'].toString()) // Nullable int (null allowed)
          : null, // If contact_number is null in the map, assign null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'inspector_id': id,
      'name': name,
      'surname': surname,
      'badge_number': badgeNumber,
      'assigned_department': assignedDepartment, // Nullable
      'contact_number': contactNumber,
    };
  }
}
