/*`File Name: <get_user_by_id.dart>
Purpose: 
-  The purpose of this file is to implement the use case for fetching a user by their id and handle exceptions.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/loggers/app_logger.dart';
import '../../../core/exceptions/custom_exception.dart';

class GetUserByEmail {
  final UserRepository repository;

  GetUserByEmail(this.repository);
  
/// Fetches a user by their email from the repository.
/// This method is asynchronous and returns a [User] object if the user exists, 
/// otherwise returns null.
/// 
/// Throws a [CustomException] if the email is empty or if the fetch operation fails.

  Future<User?> execute(String email) async {
    final appLogger = await AppLogger.getInstance();

    if (email.isEmpty) {
      final errorMessage = "Email is empty. Please provide a valid email.";
      await appLogger.log("ERROR", errorMessage, data: {
        "email": email,
      });
      throw CustomException(errorMessage, code: "INVALID_EMAIL_ERROR");
    }

    try {
      final user = await repository.fetchUserByEmail(email);

      if (user == null) {
        await appLogger.log("INFO", "No user found with the provided email.", data: {
          "email": email,
        });
      } else {
        await appLogger.log("INFO", "User fetched successfully by email.", data: {
          "email": email,
        });
      }

      return user;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by email.", data: {
        "email": email,
        "error": e.toString(),
      });
      throw CustomException("Failed to fetch user by email", code: "FETCH_USER_BY_EMAIL_ERROR");
    }
  }
}
