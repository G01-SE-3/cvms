abstract class ILogger {
  Future<void> log(String level, String message, {Map<String, dynamic>? data});
  Future<List<Map<String, dynamic>>> getLogs({String? level});
  Future<void> clearLogs();
}
