import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class DeletePV {
  final PVRepository pvRepository;

  DeletePV(this.pvRepository);

  Future<void> execute(String pvId) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Attempting to delete PV.",
          data: {"pvId": pvId});

      // Call the repository to delete the PV
      await pvRepository.deletePV(pvId);

      // Log success
      await logger.log("INFO", "Use Case - Deleted PV successfully.",
          data: {"pvId": pvId});
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Use Case - Failed to delete PV.", data: {
        "pvId": pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to delete PV with ID $pvId.",
        code: "500",
      );
    }
  }
}
