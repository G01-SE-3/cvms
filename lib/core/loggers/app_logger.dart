/*
File Name: app_logger.dart
Purpose: This file contains the implementation of AppLogger class, the logging service for the app
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'hive_logger.dart';

/// #################################################################
///? A singleton class that provides centralized logging functionality for the application.
///
/// This class ensures that there is only one instance of the logger throughout the application,
///
///! ALL logging operations should be performed using this class to ensure proper
/// handling and storage of log entries
/// #################################################################

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  late HiveLogger logger;
  AppLogger._internal();

  /// Retrieves the singleton instance of [AppLogger].
  ///
  /// This method initializes the underlying [HiveLogger] instance and assigns it to the logger field.
  /// Call this method before using the logger to ensure it is properly initialized.
  ///
  /// Returns:
  ///  A [Future<AppLogger>] that resolves to the singleton instance of [AppLogger].
  static Future<AppLogger> getInstance() async {
    // Initialize the HiveLogger and assign it to the instance's logger field.
    _instance.logger = await HiveLogger.getInstance();
    return _instance; // Return the singleton instance.
  }

  //! IMPORTANT GUIDELINE:
  /// Logs a message with the specified log level and additional data.
  ///
  /// Arguments:
  /// - [level]: A [String] indicating the severity of the log [(e.g., INFO, WARNING, ERROR).]
  /// - [message]: A [String] containing the main log message.
  /// - [data]: An optional [Map<String, dynamic>] providing additional context relevant to the log entry.
  ///
  /// Example usage:
  /// ```dart
  /// await logger.log("INFO", "User has logged in successfully.", data: {"userId": "123"});
  /// ```

  Future<void> log(String level, String message,
      {Map<String, dynamic>? data}) async {
    await getInstance();

    await logger.log(level, message, data: data);
  }
}
