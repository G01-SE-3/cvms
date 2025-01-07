import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class InsertPV {
  final PVRepository pvRepository;

  InsertPV(this.pvRepository);

  Future<void> execute(PV pvData) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Inserting PV data.", data: {
        "pvData": pvData.pvId, // Assuming PV has a toJson() method
      });

      // Call the repository method to insert the PV
      await pvRepository.insertPV(pvData);

      // Log success
      await logger.log("INFO", "Use Case - PV inserted successfully.", data: {
        "pvData": pvData.pvId,
      });
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Use Case - Failed to insert PV.", data: {
        "pvData": pvData.pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to insert PV.",
        code: "500",
      );
    }
  }
}
