import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class TotalPVCount {
  final PVRepository pvRepository;

  TotalPVCount(this.pvRepository);

  Future<int> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching total PV count");

      // Call the repository to get the total PV count
      final totalPVCount = await pvRepository.getTotalPVCount();

      // Log success
      await logger.log("INFO",
          "Use Case - Successfully fetched total PV count: $totalPVCount");

      return totalPVCount;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch total PV count", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch total PV count.",
        code: "500",
      );
    }
  }
}
