/*
File Name: get_pv_details.dart
Purpose: This file defines the GetPVDetails use case.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// Use case class to fetch the details of a specific PV by its ID.
///
/// Dependencies:
/// - [PVRepository]: The repository that fetches the PV details from the data source.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if fetching the PV details fails or if the PV is not found.
///
/// Throws:
/// - [CustomException]: If the fetching process encounters any issues or if the PV is not found.
class GetPVDetails {
  final PVRepository pvRepository;

  GetPVDetails(this.pvRepository);

  /// Fetches the details of a PV by its ID.
  ///
  /// Returns:
  /// - The details of the requested PV or `null` if not found.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process or if the PV is not found.
  Future<PV?> execute(String pvId) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching PV details for ID: $pvId.");

      // Fetch PV details from the repository
      final pv = await pvRepository.getPVById(pvId);

      if (pv == null) {
        // Log the case where the PV was not found
        await logger.log("WARNING", "Use Case - PV not found for ID: $pvId.");
        throw CustomException("PV not found", code: "404");
      }

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched PV details successfully for ID: $pvId.");

      return pv;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch PV details.", data: {
        "pvId": pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch PV details.",
        code: "500",
      );
    }
  }
}
