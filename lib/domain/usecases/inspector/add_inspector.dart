import 'package:cvms/data/models/inspector/inspector_model.dart';
import '/../domain/repositories/inspector/inspector_repository.dart';
import '/../domain/entities/inspector/inspector.dart';

class AddInspector {
  final InspectorRepository inspectorRepository;

  AddInspector({required this.inspectorRepository});

  Future<void> call(InspectorModel inspectorModel) async {
    // Convert InspectorModel to InspectorEntity
    final inspectorEntity = InspectorEntity(
      inspectorNumber: inspectorModel.id ?? 0, // Default to 0 if id is null
      name: inspectorModel.name, // name is already non-nullable
      surname: inspectorModel.surname, // surname is already non-nullable
      badgeNumber: inspectorModel.badgeNumber, // Can be null, no need for parsing
      assignedDepartment: inspectorModel.assignedDepartment ?? 'Unknown', // Default to 'Unknown' if null
      contactNumber: inspectorModel.contactNumber != null
          ? int.tryParse(inspectorModel.contactNumber.toString()) // Try parsing as int
          : null, // If null, allow null for contactNumber
    );

    // Pass the converted entity to the repository
    await inspectorRepository.addInspector(inspectorEntity);
  }
}
