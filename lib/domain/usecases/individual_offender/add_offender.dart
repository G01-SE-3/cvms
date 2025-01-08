import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class AddOffender {
  final IndividualOffenderRepository repository;

  AddOffender(this.repository);

  Future<IndividualOffender> execute(IndividualOffender offender) async {
    final appLogger = await AppLogger.getInstance();

    try {
      final addedOffender = await repository.addIndividualOffender(offender);

      await appLogger.log("INFO", "Added individual offender successfully.");

      return addedOffender;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add individual offender.", data: {
        "error": e.toString(),
      });

      throw CustomException("Failed to add individual offender", code: "ADD_INDIVIDUAL_OFFENDER_ERROR");
    }
  }
}
