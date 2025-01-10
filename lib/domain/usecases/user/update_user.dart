/*`File Name: <update_user.dart>
Purpose: 
-  The purpose of this file is to implement the use case for updating a user's details and handle exceptions.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

/// Updates an existing user's details in the repository.
/// This method is asynchronous and returns a boolean value indicating
/// the success (true) or failure (false) of the update operation.
/// 
/// Throws a [CustomException] if the update operation fails.

  Future<bool> execute(User user, String username) async {
    final appLogger = await AppLogger.getInstance();

    if (user.username.isEmpty || user.email.isEmpty) {
      final errorMessage = "Cannot update user. One or more required fields are empty.";

      await appLogger.log("ERROR", errorMessage, data: {
        "username": user.username,
        "email": user.email,
      });

      print(errorMessage);
      return false;
    }

    try {
      await repository.updateUser(user, username);

      await appLogger.log("INFO", "User updated successfully.", data: {
        "username": user.username,
        "email": user.email,
      });

      return true;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to update user.", data: {
        "username": user.username,
        "email": user.email,
        "error": e.toString(),
      });

      throw CustomException("Failed to update user", code: "UPDATE_USER_ERROR");
    }
  }
}
