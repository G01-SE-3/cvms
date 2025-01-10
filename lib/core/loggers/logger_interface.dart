/*
File Name: logger_interface.dart
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
abstract class ILogger {
  Future<void> log(String level, String message, {Map<String, dynamic>? data});
  Future<List<Map<String, dynamic>>> getLogs({String? level});
  Future<void> clearLogs();
}
