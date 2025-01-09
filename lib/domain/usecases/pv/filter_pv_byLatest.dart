import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetLatestPVs {
  final PVRepository pvRepository;

  GetLatestPVs(this.pvRepository);

  Future<List<PV>> execute(int number) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching the latest PVs.", data: {
        "number": number,
      });

      // Fetch the latest PVs from the repository
      final pvList = await pvRepository.filterByLatest(number);

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched the latest PVs successfully.",
          data: {
            "number": number,
            "pvCount": pvList.length,
          });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch the latest PVs.", data: {
        "number": number,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch the latest $number PVs.",
        code: "500",
      );
    }
  }
}
