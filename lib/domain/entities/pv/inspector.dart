import 'package:cvms/data/models/pv/inspector_model.dart';

class Inspector {
  final int inspectorId;
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;

  Inspector({
    required this.inspectorId,
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  });

  // Convert to model
  InspectorModel toModel() {
    return InspectorModel(
      inspectorId: inspectorId,
      inspectorName: inspectorName,
      inspectorSurname: inspectorSurname,
      inspectorDepartment: inspectorDepartment,
      contactNumber: contactNumber,
    );
  }
}
