import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';

class AddOffender {
  final IndividualOffenderRepository repository;

  AddOffender(this.repository);

  Future<IndividualOffender> execute(
    IndividualOffender offender,
  ) async {
    final addedOffender = await repository.addIndividualOffender(offender);
    return addedOffender;
  }
}
