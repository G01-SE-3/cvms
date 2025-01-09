import 'package:cvms/data/models/pv/offender.dart';

class Offender {
  final String id;
  final String type;
  final String? name;
  final String? rcNumber;
  Offender({required this.id, required this.type, this.name, this.rcNumber});
  OffenderModel toModel() {
    return OffenderModel(id: id, type: type, name: name, rcNumber: rcNumber);
  }
}
