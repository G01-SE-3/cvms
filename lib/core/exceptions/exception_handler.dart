import '../loggers/app_logger.dart';
import 'custom_exception.dart';

class ExceptionHandler {
  static final ExceptionHandler _instance = ExceptionHandler._internal();
  late final AppLogger _appLogger;

  ExceptionHandler._internal();

  static Future<ExceptionHandler> getInstance() async {
    _instance._appLogger = await AppLogger.getInstance();
    return _instance;
  }

  Future<void> handleException(Exception e) async {
    // Log the exception using the custom logger
    if (e is CustomException) {
      // Log custom exceptions with level "WARNING"
      await _appLogger.logger.log(
        "WARNING",
        e.toString(),
        data: {"timestamp": DateTime.now().toIso8601String(), "code": e.code},
      );

      // Handle the custom exception
      await _handleCustomException(e);
    } else {
      // Log generic exceptions with level "ERROR"
      await _appLogger.logger.log(
        "ERROR",
        e.toString(),
        data: {"timestamp": DateTime.now().toIso8601String()},
      );

      // Handle the generic exception
      await _handleGenericException(e);
    }
  }

  Future<void> _handleCustomException(CustomException e) async {
    print('Custom Exception: ${e.message}');
  }

  Future<void> _handleGenericException(Exception e) async {
    print('An unexpected error occurred: ${e.toString()}');
  }
}
