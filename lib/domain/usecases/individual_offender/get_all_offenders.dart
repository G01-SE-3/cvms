
/*
/* FIX THE IMPORTS IN CASE OF A MISTAKE*/
import '../../../domain/entities/individual_offender.dart';
import '../../../domain/usecases/get_all_offenders.dart';
import '../../../domain/usecases/add_offender.dart';

class IndividualOffenderController {
  final GetAllOffenders getAllOffenders;
  final AddOffender addOffender;

  IndividualOffenderController({
    required this.getAllOffenders,
    required this.addOffender,
  });

  Future<List<IndividualOffender>> fetchOffenders() async {
    return await getAllOffenders.execute();
  }

  Future<void> addNewOffender(IndividualOffender offender) async {
    await addOffender.execute(offender);
  }
}
*/