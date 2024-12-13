import 'package:cvms/domain/entities/pv/inspector.dart';

class InspectorModel {
  final int inspectorId;
  final String inspectorName;
  final String inspectorSurname;
  final String inspectorDepartment;
  final String contactNumber;

  InspectorModel({
    required this.inspectorId,
    required this.inspectorName,
    required this.inspectorSurname,
    required this.inspectorDepartment,
    required this.contactNumber,
  });

  Inspector toEntity() {
    return Inspector(
      inspectorId: inspectorId,
      inspectorName: inspectorName,
      inspectorSurname: inspectorSurname,
      inspectorDepartment: inspectorDepartment,
      contactNumber: contactNumber,
    );
  }
}
