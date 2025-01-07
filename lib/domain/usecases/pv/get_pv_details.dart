import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetPVDetails {
  final PVRepository pvRepository;

  GetPVDetails(this.pvRepository);

  Future<PV?> execute(String pvId) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching PV details for ID: $pvId.");

      // Fetch PV details from the repository
      final pv = await pvRepository.getPVById(pvId);

      if (pv == null) {
        // Log the case where the PV was not found
        await logger.log("WARNING", "Use Case - PV not found for ID: $pvId.");
        throw CustomException("PV not found", code: "404");
      }

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched PV details successfully for ID: $pvId.");

      return pv;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch PV details.", data: {
        "pvId": pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch PV details.",
        code: "500",
      );
    }
  }
}
