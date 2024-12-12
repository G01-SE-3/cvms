import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
abstract class IndividualOffenderRepository {
  Future<List<IndividualOffender>> fetchAllOffenders();
  Future<void> addOffender(IndividualOffender offender);
}

