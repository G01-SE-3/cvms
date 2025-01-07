import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetPVsByNumber {
  final PVRepository pvRepository;

  GetPVsByNumber(this.pvRepository);

  Future<List<PV>> execute(int pvNumber) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log(
          "INFO", "Use Case - Fetching PVs with pvNumber: $pvNumber");

      // Call the repository method to search for PVs by number
      final pvs = await pvRepository.searchPV(pvNumber);

      // Log success
      await logger.log("INFO",
          "Use Case - Successfully fetched PVs with pvNumber: $pvNumber",
          data: {
            "pvCount": pvs.length,
          });

      return pvs;
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log(
          "ERROR", "Use Case - Failed to fetch PVs with pvNumber: $pvNumber",
          data: {
            "error": e.toString(),
            "stackTrace": stackTrace.toString(),
          });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch PVs with pvNumber $pvNumber.",
        code: "500",
      );
    }
  }
}
