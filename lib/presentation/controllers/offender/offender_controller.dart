import 'package:cvms/domain/entities/rc/register_number_entity.dart';
import 'package:cvms/domain/usecases/offender/get_offender_by_rc.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class OffenderController {
  final GetOffenderByRC getOffenderByRC;

  OffenderController(this.getOffenderByRC);

  Future<Map<String, dynamic>> fetchOffenderByRC(
      String commercialRegisterNumber) async {
    final appLogger = await AppLogger.getInstance();

    try {
      final offenderDetails =
          await getOffenderByRC.execute(commercialRegisterNumber);
      return offenderDetails;
    } catch (e) {
      await appLogger.log(
          "ERROR", "Error fetching offender details: ${e.toString()}",
          data: {
            "commercialRegisterNumber": commercialRegisterNumber,
          });

      throw CustomException("Failed to fetch offender details",
          code: "FETCH_OFFENDER_BY_RC_ERROR");
    }
  }
}
