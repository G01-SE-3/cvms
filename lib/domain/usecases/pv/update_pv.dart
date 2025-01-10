/*
File Name: update_pv.dart
Purpose: This file defines the UpdatePV use case, which updates the details of a Process Verbal (PV).
The `execute` method interacts with the [PVRepository] to update a PV and logs the operation.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/pv.dart'; // Import for PV entity
import 'package:cvms/domain/repositories/pv/pv_repository.dart'; // Import for PV repository
import 'package:cvms/core/exceptions/custom_exception.dart'; // Import for custom exception handling
import 'package:cvms/core/loggers/app_logger.dart'; // Import for app logger

/// Use case class to update the details of a Process Verbal (PV).
///
/// Dependencies:
/// - [PVRepository]: The repository that updates the PV details.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the update process fails.
///
/// Throws:
/// - [CustomException]: If the update process encounters any issues.
class UpdatePV {
  final PVRepository pvRepository;

  UpdatePV(this.pvRepository);

  /// Updates a PV's details in the repository.
  ///
  /// Parameters:
  /// - [pvData]: The PV object containing the updated data.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the updating process.
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
