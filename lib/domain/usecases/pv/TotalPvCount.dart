/*
File Name: total_pv_count.dart
Purpose: This file defines the TotalPVCount use case, which retrieves the total number of Process Verbals (PVs) from the repository.
The `execute` method interacts with the [PVRepository] to fetch the total PV count and logs the operation.
Authors:
- Team Member 1 hiba.ayadi@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

/// Use case class to fetch the total count of Process Verbals (PVs).
///
/// Dependencies:
/// - [PVRepository]: The repository that provides the total PV count.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if the fetch process fails.
///
/// Throws:
/// - [CustomException]: If the fetch process encounters any issues.
class TotalPVCount {
  final PVRepository pvRepository;

  TotalPVCount(this.pvRepository);

  /// Fetches the total count of PVs.
  ///
  /// Returns:
  /// - An integer representing the total number of PVs.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.
  Future<int> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching total PV count");

      // Call the repository to get the total PV count
      final totalPVCount = await pvRepository.getTotalPVCount();

      // Log success
      await logger.log("INFO",
          "Use Case - Successfully fetched total PV count: $totalPVCount");

      return totalPVCount;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch total PV count", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch total PV count.",
        code: "500",
      );
    }
  }
}
