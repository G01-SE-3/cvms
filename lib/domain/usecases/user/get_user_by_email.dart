/*`File Name: <get_user_by_email.dart>
Purpose: 
-  The purpose of this file is to implement the use case for fetching a user by email and handle exceptions.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetUserByEmail {
  final UserRepository repository;

/// Fetches a user by their email from the repository.
/// This method is asynchronous and returns a [User] object if the user exists, 
/// otherwise returns null.
/// 
/// Throws a [CustomException] if the fetch operation fails.

  GetUserByEmail(this.repository);

  Future<User?> execute(String email) async {
    final appLogger = await AppLogger.getInstance();

    try {
      return await repository.fetchUserByEmail(email);
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by email.", data: {
        "email": email,
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch user by email", code: "GET_USER_ERROR");
    }
  }
}
