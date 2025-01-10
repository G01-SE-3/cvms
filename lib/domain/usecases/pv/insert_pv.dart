/*
File Name: insert_pv.dart
Purpose: This file defines the InsertPV use case, which handles inserting a new PV
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

/// Use case class to insert a new Process Verbal (PV) into the system.
///
/// Dependencies:
/// - [PVRepository]: The repository that inserts the PV data into the data source.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the insertion process fails.
///
/// Throws:
/// - [CustomException]: If the insertion process encounters any issues.
class InsertPV {
  final PVRepository pvRepository;

  InsertPV(this.pvRepository);

  /// Inserts a new PV into the system.
  ///
  /// Parameters:
  /// - [pvData]: The PV entity to be inserted into the system.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the insertion process.
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
