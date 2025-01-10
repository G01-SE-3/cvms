/*
File Name: get_monthly_pv_counts.dart
Purpose: This file defines the GetMonthlyPVCounts use case, which fetches the monthly count of Process Verbals (PVs).
The `execute` method interacts with the repository to retrieve the counts and logs the operation for monitoring purposes.
Authors:
- Team Member 1 hiba.ayadi@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// Use case class to fetch monthly PV counts from the system.
///
/// Dependencies:
/// - [PVRepository]: The repository that retrieves the monthly PV counts from the data source.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the fetch process fails.
///
/// Throws:
/// - [CustomException]: If the fetch process encounters any issues.
class GetMonthlyPVCounts {
  final PVRepository pvRepository;

  GetMonthlyPVCounts(this.pvRepository);

  /// Fetches the monthly PV counts from the repository.
  ///
  /// Returns:
  /// - A list of integers representing the monthly PV counts.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.
  Future<List<int>> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching monthly PV counts.");

      // Call the repository method to get monthly PV counts
      final counts = await pvRepository.getMonthlyPVCounts();

      // Log success
      await logger.log(
          "INFO", "Use Case - Monthly PV counts fetched successfully.",
          data: {
            "counts": counts,
          });

      return counts;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch monthly PV counts.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch monthly PV counts.",
        code: "500",
      );
    }
  }
}
