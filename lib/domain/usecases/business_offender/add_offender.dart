import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class AddOffender {
  final BusinessOffenderRepository repository;

  AddOffender(this.repository);

  Future<BusinessOffender> execute(BusinessOffender offender) async {
    final appLogger = await AppLogger.getInstance();

    try {
      final addedOffender = await repository.addOffender(offender);

      await appLogger.log("INFO", "Business offender added successfully.", data: {
        "offender": offender.toString(),
      });

      return addedOffender;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add business offender.", data: {
        "offender": offender.toString(),
        "error": e.toString(),
      });

      throw CustomException("Failed to add business offender", code: "ADD_OFFENDER_ERROR");
    }
  }
}
