import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class UpdatePV {
  final PVRepository pvRepository;

  UpdatePV(this.pvRepository);

  Future<void> execute(PV pvData) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log(
          "INFO", "Use Case - Updating PV with ID: ${pvData.pvId}");

      // Call the repository method to update the PV
      await pvRepository.updatePV(pvData);

      // Log success
      await logger.log(
          "INFO", "Use Case - Successfully updated PV with ID: ${pvData.pvId}");
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log(
          "ERROR", "Use Case - Failed to update PV with ID: ${pvData.pvId}",
          data: {
            "error": e.toString(),
            "stackTrace": stackTrace.toString(),
          });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to update PV.",
        code: "500",
      );
    }
  }
}
