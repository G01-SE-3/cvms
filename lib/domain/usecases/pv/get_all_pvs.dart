import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class GetAllPVs {
  final PVRepository pvRepository;

  GetAllPVs(this.pvRepository);

  Future<List<PV>> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching all PVs.");

      // Fetch all PVs from the repository
      final pvList = await pvRepository.getAllPVs();

      // Log success
      await logger
          .log("INFO", "Use Case - Fetched all PVs successfully.", data: {
        "pvCount": pvList.length,
      });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Use Case - Failed to fetch all PVs.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch all PVs.",
        code: "500",
      );
    }
  }
}
