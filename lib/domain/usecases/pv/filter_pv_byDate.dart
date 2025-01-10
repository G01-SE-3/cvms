/*
File Name: get_pvs_by_date.dart
Purpose: This file defines the GetPVsByDate use case, which fetches a list of PVs (Process Verbals) that fall within a specified date range. The `execute` method calls the repository to retrieve the filtered list of PVs, handles success and failure scenarios, and logs detailed information during the process.
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

/// Use case class to fetch PVs (Process Verbals) by a specified date range.
///
/// Dependencies:
/// - [PVRepository]: The repository that performs the actual filtering of PVs based on the provided date range.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if fetching the PVs fails.
///
/// Throws:
/// - [CustomException]: If the fetching process encounters any issues.
class GetPVsByDate {
  final PVRepository pvRepository;

  GetPVsByDate(this.pvRepository);

  /// Fetches a list of PVs (Process Verbals) that fall within the specified date range.
  ///
  /// Parameters:
  /// - [startDate]: The start date of the date range.
  /// - [endDate]: The end date of the date range.
  ///
  /// Returns:
  /// - A list of PVs within the specified date range.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.
  Future<List<PV>> execute(DateTime startDate, DateTime endDate) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching PVs by date range.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      });

      // Fetch the PVs using the repository
      final pvList = await pvRepository.filterByDate(startDate, endDate);

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched PVs by date range successfully.",
          data: {
            "startDate": startDate.toIso8601String(),
            "endDate": endDate.toIso8601String(),
            "pvCount": pvList.length,
          });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch PVs by date range.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch PVs between $startDate and $endDate.",
        code: "500",
      );
    }
  }
}
