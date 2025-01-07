import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetPVsByDate {
  final PVRepository pvRepository;

  GetPVsByDate(this.pvRepository);

  Future<List<PV>> execute(DateTime startDate, DateTime endDate) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching PVs by date range.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      });

      // Fetch the PVs using the repository
      final pvList = await pvRepository.filterByDate(startDate, endDate);

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched PVs by date range successfully.",
          data: {
            "startDate": startDate.toIso8601String(),
            "endDate": endDate.toIso8601String(),
            "pvCount": pvList.length,
          });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch PVs by date range.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch PVs between $startDate and $endDate.",
        code: "500",
      );
    }
  }
}
