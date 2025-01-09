import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetOffenderByRC {
  final RegisterNumberRepository repository;

  GetOffenderByRC(this.repository);

  Future<Map<String, dynamic>> execute(String commercialRegisterNumber) async {
    final appLogger = await AppLogger.getInstance();

    try {
      final offenderDetails =
          await repository.getOffenderByRC(commercialRegisterNumber);

      await appLogger.log("INFO",
          "Fetched offender details for commercial register number: $commercialRegisterNumber.");

      return offenderDetails;
    } catch (e) {
      await appLogger.log("ERROR",
          "Failed to fetch offender details for commercial register number: $commercialRegisterNumber.",
          data: {
            "error": e.toString(),
          });

      throw CustomException("Failed to fetch offender details",
          code: "FETCH_OFFENDER_BY_RC_ERROR");
    }
  }
}
