import 'dart:convert';
import 'logger_interface.dart';
import 'package:hive/hive.dart';

class HiveLogger implements ILogger {
  static const _boxName = "logsBox";

  HiveLogger._internal();

  static Future<HiveLogger> getInstance() async {
    final logger = HiveLogger._internal();
    await logger._initHive();
    return logger;
  }

  Future<void> _initHive() async {
    // Initialize Hive and open the box for logs
    Hive.init('./hive_logs');
    await Hive.openBox(_boxName);
  }

  @override
  Future<void> log(String level, String message,
      {Map<String, dynamic>? data}) async {
    final timestamp = DateTime.now().toIso8601String();
    final logData = {
      'timestamp': timestamp,
      'level': level,
      'message': message,
      'data': data != null ? jsonEncode(data) : null,
    };

    final box = Hive.box(_boxName);

    // Insert the log data
    await box.add(logData);
  }

  @override
  Future<List<Map<String, dynamic>>> getLogs({String? level}) async {
    final box = Hive.box(_boxName);
    List<Map<String, dynamic>> logs = [];

    // Retrieve values from the box and ensure type safety
    for (var value in box.values) {
      if (value is Map) {
        logs.add(Map<String, dynamic>.from(
            value)); // Ensure it's a Map<String, dynamic>
      }
    }

    // Filter logs by level if specified
    if (level != null) {
      logs = logs.where((log) => log['level'] == level).toList();
    }
    return logs; // Return the list of logs
  }

  @override
  Future<void> clearLogs() async {
    final box = Hive.box(_boxName);
    await box.clear(); // Clears all logs from the Hive box
  }
}
