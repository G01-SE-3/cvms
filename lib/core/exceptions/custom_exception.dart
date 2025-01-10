/*
File Name: custom_exception.dart
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

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
