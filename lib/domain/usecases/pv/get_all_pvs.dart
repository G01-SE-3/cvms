/*
File Name: get_all_pvs.dart
Purpose: This file defines the GetAllPVs use case, which fetches all the Process Verbals (PVs) from the repository. The `execute` method retrieves all PVs and handles success and failure scenarios by logging the result and throwing a custom exception if needed.
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

/// Use case class to fetch all PVs (Process Verbals) from the repository.
///
/// Dependencies:
/// - [PVRepository]: The repository that fetches all the PVs from the data source.
/// - [AppLogger]: The logger used for logging information, errors, and stack traces during the operation.
/// - [CustomException]: Custom exception thrown if fetching the PVs fails.
///
/// Throws:
/// - [CustomException]: If the fetching process encounters any issues.
class GetAllPVs {
  final PVRepository pvRepository;

  GetAllPVs(this.pvRepository);

  /// Fetches all the PVs (Process Verbals) from the repository.
  ///
  /// Returns:
  /// - A list of all the PVs.
  ///
  /// Throws:
  /// - [CustomException]: If an error occurs during the fetching process.
  Future<List<PV>> execute() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method invocation with layer information
      await logger.log("INFO", "Use Case - Fetching all PVs.");

      // Fetch all PVs from the repository
      final pvList = await pvRepository.getAllPVs();

      // Log success
      await logger
          .log("INFO", "Use Case - Fetched all PVs successfully.", data: {
        "pvCount": pvList.length,
      });

      return pvList;
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Use Case - Failed to fetch all PVs.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap and throw a CustomException
      throw CustomException(
        "Failed to fetch all PVs.",
        code: "500",
      );
    }
  }
}
