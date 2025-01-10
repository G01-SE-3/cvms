/*
File Name: get_pvs_by_number.dart
Purpose: This file defines the GetPVsByNumber use case, which fetches Process Verbals (PVs) based on a given PV number.
The `execute` method interacts with the [PVRepository] to search for PVs by their number and logs the operation.
Authors:
- Team Member 1 hiba.ayadi@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// Use case class to fetch PVs based on the given PV number.
///
/// Dependencies:
/// - [PVRepository]: The repository that searches for PVs by their number.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the fetch process fails.
///
/// Throws:
/// - [CustomException]: If the fetch process encounters any issues.
class GetPVsByNumber {
  final PVRepository pvRepository;

  GetPVsByNumber(this.pvRepository);

  /// Fetches PVs by their number.
  ///
  /// Returns:
  /// - A list of [PV] objects that match the given PV number.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.

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
