/*`File Name: <get_all_users.dart>
Purpose: 
-  The purpose of this file is to implement the use case for fetching all users and handle exceptions.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/loggers/app_logger.dart';
import '../../../core/exceptions/custom_exception.dart';

class GetAllUsers {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);

  /// Executes the use case to fetch all users from the repository.
  /// This method calls the repository's `getAllUsers` method and handles any exceptions.
  /// 
  /// Throws a [CustomException] if the fetch operation fails.

  Future<List<User>> execute() async {
    final appLogger = await AppLogger.getInstance();

    try {
      final users = await userRepository.getAllUsers();
            await appLogger.log("INFO", "Fetched all users successfully.");
      
      return users;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch all users.", data: {
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch all users", code: "FETCH_ALL_USERS_ERROR");
    }
  }
}
