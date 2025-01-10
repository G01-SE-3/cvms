/*
File Name: pv_repository_impl.dart
Purpose: This file contains the implementation of the PVRepository interface, providing methods 
to interact with the PV data source.
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/pv/pv.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/domain/repositories/pv/pv_repository.dart';
import 'package:cvms/core/exceptions/custom_exception.dart';
import 'package:cvms/core/loggers/app_logger.dart';

class PVRepositoryImpl implements PVRepository {
  final PVDataSource dataSource;

  PVRepositoryImpl(this.dataSource);

  @override
  Future<PV?> getPVById(String pvId) async {
    final logger = (await AppLogger.getInstance()).logger;
    // Ensure logger instance is available
    try {
      // Log the method call
      await logger.log("INFO", "Fetching PV details.", data: {"pvId": pvId});

      // Call data source to get PV details
      final pvModel = await dataSource.getPVDetails(pvId);
      if (pvModel == null) {
        // Log the missing data
        await logger.log("WARNING", "PV not found.", data: {"pvId": pvId});
        throw CustomException("PV not found", code: "404");
      }

      // Log success
      await logger
          .log("INFO", "Fetched PV successfully.", data: {"pvId": pvId});

      // Return the entity converted from the model
      return pvModel.toEntity();
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to fetch PV by ID.", data: {
        "pvId": pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Wrap in a CustomException if it's not already one
      if (e is! CustomException) {
        throw CustomException(
          "An error occurred while fetching the PV",
          code: "500",
        );
      }

      // Rethrow the custom exception
      rethrow;
    }
  }

  @override
  Future<List<PV>> getAllPVs() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Fetching all PVs.");

      // Fetch all PVs from the data source
      final pvModels = await dataSource.getAllPVs();

      // Log success
      await logger.log("INFO", "Fetched all PVs successfully.");

      // Convert the list of models to entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to fetch all PVs.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Throw a custom exception
      throw CustomException("An error occurred while fetching all PVs",
          code: "500");
    }
  }

  @override
  Future<void> insertPV(PV pvEntity) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Inserting a new PV.",
          data: {"pvEntity": pvEntity.toString()});

      // Convert the entity to a model and insert into the data source
      final pvModel = pvEntity.toModel();
      await dataSource.insertPV(pvModel);

      // Log success
      await logger.log("INFO", "Inserted PV successfully.",
          data: {"pvId": pvModel.pvId});
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to insert PV.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Throw a custom exception
      throw CustomException("An error occurred while inserting the PV",
          code: "500");
    }
  }

  @override
  Future<List<PV>> searchPV(int pvNumber) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger
          .log("INFO", "Searching for PVs.", data: {"pvNumber": pvNumber});

      // Fetch PVs by PV number
      final pvModels = await dataSource.searchPV(pvNumber);

      // Log success
      await logger
          .log("INFO", "Found PVs successfully.", data: {"pvNumber": pvNumber});

      // Convert the list of models to entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to search PVs.", data: {
        "pvNumber": pvNumber,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException("An error occurred while searching for PVs",
          code: "500");
    }
  }

  @override
  Future<List<PV>> filterByLatest(int number) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger
          .log("INFO", "Filtering latest PVs.", data: {"count": number});

      // Fetch the latest PVs from the data source
      final pvModels = await dataSource.filterByLatest(number);

      // Log success
      await logger.log("INFO", "Fetched latest PVs successfully.",
          data: {"count": number});

      // Convert the list of models to entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to filter latest PVs.", data: {
        "count": number,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException("An error occurred while filtering latest PVs",
          code: "500");
    }
  }

  @override
  Future<List<PV>> filterByDate(DateTime startDate, DateTime endDate) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Filtering PVs by date.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      });

      // Fetch PVs within the date range from the data source
      final pvModels = await dataSource.filterByDate(startDate, endDate);

      // Log success
      await logger.log("INFO", "Filtered PVs by date successfully.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      });

      // Convert the list of models to entities
      return pvModels.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to filter PVs by date.", data: {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException("An error occurred while filtering PVs by date",
          code: "500");
    }
  }

  @override
  Future<void> updatePV(PV pvEntity) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger
          .log("INFO", "Updating PV.", data: {"pvEntity": pvEntity.toString()});

      // Convert the entity to a model and update in the data source
      final pvModel = pvEntity.toModel();
      await dataSource.updatePV(pvModel);

      // Log success
      await logger.log("INFO", "Updated PV successfully.",
          data: {"pvId": pvModel.pvId});
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to update PV.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException("An error occurred while updating the PV",
          code: "500");
    }
  }

  @override
  Future<void> deletePV(String pvId) async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Deleting PV.", data: {"pvId": pvId});

      // Delete the PV from the data source
      await dataSource.deletePV(pvId);

      // Log success
      await logger
          .log("INFO", "Deleted PV successfully.", data: {"pvId": pvId});
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to delete PV.", data: {
        "pvId": pvId,
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException("An error occurred while deleting the PV",
          code: "500");
    }
  }

  @override
  Future<List<int>> getMonthlyPVCounts() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Fetching monthly PV counts.");

      // Fetch the monthly PV counts from the data source
      final monthlyPVCounts = await dataSource.getMonthlyPVCounts();

      // Check if data is empty and log warning
      if (monthlyPVCounts.isEmpty) {
        await logger.log("WARNING", "No PV data found for the current year.");
        throw CustomException("No PV data found for the current year",
            code: "404");
      }

      // Log success
      await logger.log("INFO", "Fetched monthly PV counts successfully.");

      return monthlyPVCounts;
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to fetch monthly PV counts.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      throw CustomException(
          "An error occurred while fetching monthly PV counts",
          code: "500");
    }
  }

  @override
  Future<int> getTotalPVCount() async {
    final logger = (await AppLogger.getInstance()).logger;

    try {
      // Log the method call
      await logger.log("INFO", "Fetching total PV count.");

      // Call data source to get the total PV count
      final totalPVCount = await dataSource.getTotalPVCount();

      // Check if no PV data is found and log a warning
      if (totalPVCount == 0) {
        await logger.log("WARNING", "No PV data found.");
        throw CustomException("No PV data found.", code: "404");
      }

      // Log success
      await logger.log("INFO", "Fetched total PV count successfully.", data: {
        "totalPVCount": totalPVCount,
      });

      // Return the total PV count
      return totalPVCount;
    } catch (e, stackTrace) {
      // Log the exception
      await logger.log("ERROR", "Failed to fetch total PV count.", data: {
        "error": e.toString(),
        "stackTrace": stackTrace.toString(),
      });

      // Throw a custom exception
      throw CustomException(
        "An error occurred while fetching the total PV count",
        code: "500",
      );
    }
  }
}
