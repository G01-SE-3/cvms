import 'package:cvms/data/models/pv/offender.dart';

class Offender {
  final String name;

  Offender({required this.name});
  OffenderModel toModel() {
    return OffenderModel(name: name);
  }
}
