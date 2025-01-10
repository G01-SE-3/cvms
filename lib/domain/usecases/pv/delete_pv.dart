/*
File Name: delete_pv.dart
Purpose: This file defines the DeletePV use case, which is responsible for deleting a PV (Process Verbal) from the repository. The `execute` method attempts to delete a PV by its ID and handles any errors or exceptions that may occur during the deletion process.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// Use case class to delete a PV (Process Verbal).
/// The class interacts with the PVRepository to delete the specified PV by its ID.
///
/// Dependencies:
/// - [PVRepository]: The repository that performs the actual deletion of the PV from the data source.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the deletion fails.
///
/// Throws:
/// - [CustomException]: If the deletion process encounters any issues, a CustomException is thrown with a descriptive message.
class DeletePV {
  final PVRepository pvRepository;

  DeletePV(this.pvRepository);

  /// Deletes a PV (Process Verbal) identified by [pvId] from the repository.
  ///
  ///
  /// Parameters:
  /// - [pvId]: The ID of the PV to be deleted.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the deletion process.
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
