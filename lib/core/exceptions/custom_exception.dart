// #############################################
// !how to use?
/*  
  final exceptionHandler = await ExceptionHandler.getInstance();

  try {
  
    throw CustomException("Something went wrong!", code: "1234");
  } catch (e) {
    
    if (e is Exception) {
      await exceptionHandler.handleException(e);
    } else {
      print("Non-Exception object caught: $e");
    }
*/
// #############################################

class CustomException implements Exception {
  final String message;
  final String? code;

  CustomException(this.message, {this.code});

  @override
  String toString() {
    return 'CustomException: $message${code != null ? ', Code: $code' : ''}';
  }
}
