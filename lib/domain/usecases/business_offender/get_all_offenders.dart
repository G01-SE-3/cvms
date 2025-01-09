import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetAllOffenders {
  final BusinessOffenderRepository repository;

  GetAllOffenders(this.repository);

  Future<List<BusinessOffender>> execute() async {
    final appLogger = await AppLogger.getInstance();

    try {
      final offenders = await repository.fetchAllOffenders();

      await appLogger.log("INFO", "Fetched all business offenders.");

      return offenders;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch all business offenders.", data: {
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch all business offenders", code: "FETCH_ALL_OFFENDERS_ERROR");
    }
  }
}
