import 'package:cvms/domain/entities/pv/offender.dart';

class OffenderModel {
  final String name;

  OffenderModel({required this.name});

  Offender toEntity() {
    return Offender(name: name);
  }
}
