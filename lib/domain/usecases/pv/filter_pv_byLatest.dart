/*
File Name: get_latest_pvs.dart
Purpose: This file defines the GetLatestPVs use case, which fetches a specified number of the latest PVs (Process Verbals) from the repository. The `execute` method interacts with the repository to retrieve the latest PVs, logs the operation, and handles success and failure scenarios, throwing a custom exception in case of failure.
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

/// Use case class to fetch the latest PVs (Process Verbals) from the repository.
///
/// Dependencies:
/// - [PVRepository]: The repository that performs the actual filtering of the latest PVs based on the specified number.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if fetching the latest PVs fails.
///
/// Throws:
/// - [CustomException]: If the fetching process encounters any issues.
class GetLatestPVs {
  final PVRepository pvRepository;

  GetLatestPVs(this.pvRepository);

  /// Fetches a list of the latest PVs (Process Verbals) from the repository.
  ///
  ///
  /// Parameters:
  /// - [number]: The number of latest PVs to fetch.
  ///
  /// Returns:
  /// - A list of the latest PVs, with a length determined by the provided [number].
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.
  Future<List<PV>> execute(int number) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching the latest PVs.", data: {
        "number": number,
      });

      // Fetch the latest PVs from the repository
      final pvList = await pvRepository.filterByLatest(number);

      // Log success
      await logger.log(
          "INFO", "Use Case - Fetched the latest PVs successfully.",
          data: {
            "number": number,
            "pvCount": pvList.length,
          });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger
          .log("ERROR", "Use Case - Failed to fetch the latest PVs.", data: {
        "number": number,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch the latest $number PVs.",
        code: "500",
      );
    }
  }
}
