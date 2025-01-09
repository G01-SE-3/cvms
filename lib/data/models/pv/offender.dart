import 'package:cvms/domain/entities/pv/offender.dart';

class OffenderModel {
  final String id;
  final String type;
  final String? name;
  final String? rcNumber;
  OffenderModel(
      {required this.id, required this.type, this.name, this.rcNumber});

  Offender toEntity() {
    return Offender(id: id, type: type, name: name, rcNumber: rcNumber);
  }
}
