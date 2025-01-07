import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetMonthlyPVCounts {
  final PVRepository pvRepository;

  GetMonthlyPVCounts(this.pvRepository);

  Future<List<int>> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching monthly PV counts.");

      // Call the repository method to get monthly PV counts
      final counts = await pvRepository.getMonthlyPVCounts();

      // Log success
      await logger.log(
          "INFO", "Use Case - Monthly PV counts fetched successfully.",
          data: {
            "counts": counts,
          });

      return counts;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch monthly PV counts.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch monthly PV counts.",
        code: "500",
      );
    }
  }
}
