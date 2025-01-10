/*`File Name: <add_user.dart>
Purpose: 
-  The purpose of this file is to implement the use case for adding a user and handle exceptions.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/data/models/user/user_model.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '/../domain/entities/user/user.dart';  
import 'package:cvms/core/loggers/app_logger.dart'; 
import 'package:cvms/core/exceptions/custom_exception.dart'; 

class AddUser {
  final UserRepository userRepository;

  /// Calls the repository to add a new user.
  /// This method transforms the data from [UserModel] to [User] entity and
  /// invokes the repository method to add the user.
  /// 
  /// Throws a [CustomException] if the add operation fails.

  AddUser({required this.userRepository});
  Future<void> call(UserModel userModel) async {
    final appLogger = await AppLogger.getInstance(); 

    try {
      final userEntity = User(
        username: userModel.username,
        email: userModel.email,
        hashedPassword: userModel.getHashedPassword,
      );

      await userRepository.addUser(userEntity);

      await appLogger.log("INFO", "User added successfully.", data: {
        "username": userEntity.username,
        "email": userEntity.email,
      });
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add user.", data: {
        "username": userModel.username,
        "email": userModel.email,
        "error": e.toString(),
      });

      throw CustomException("Failed to add user", code: "ADD_USER_ERROR");
    }
  }
}
