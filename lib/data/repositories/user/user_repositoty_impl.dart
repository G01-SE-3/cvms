import 'package:cvms/data/datasources/user/user_datasource.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import 'package:cvms/data/models/user/user_model.dart';
import 'package:cvms/domain/entities/user/user.dart';

import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _datasource = UserDataSource();

  @override
  Future<List<User>> getAllUsers() async {
    final appLogger = await AppLogger.getInstance();
    try {
      final users = await _datasource.fetchAllUsers();
      
      // Log success
      await appLogger.log("INFO", "Fetched all users successfully.");
      
      return users.map((model) => toEntity(model)).toList();
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch all users.", data: {"error": e.toString()});
      
      throw CustomException("Failed to fetch all users", code: "FETCH_USERS_ERROR");
    }
  }

  @override
  Future<User?> fetchUserByUsername(String username) async {
    final appLogger = await AppLogger.getInstance(); 
    if (username.isEmpty) {
      final errorMessage = "Username is empty. Please provide a valid username.";
      
      await appLogger.log("ERROR", errorMessage, data: {"username": username});
      
      print(errorMessage);
      return null;
    }
    
    try {
      final user = await _datasource.fetchUserByUsername(username);
      
      if (user != null) {
        await appLogger.log("INFO", "Fetched user by username successfully.", data: {"username": username});
        return toEntity(user);
      } else {
        await appLogger.log("INFO", "No user found for the given username.", data: {"username": username});
        return null;
      }
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by username.", data: {
        "username": username,
        "error": e.toString(),
      });
      
      throw CustomException("Failed to fetch user by username", code: "FETCH_USER_BY_USERNAME_ERROR");
    }
  }

  @override
  Future<User?> fetchUserByEmail(String email) async {
    final appLogger = await AppLogger.getInstance(); 
    if (email.isEmpty) {
      final errorMessage = "Email is empty. Please provide a valid email.";
            await appLogger.log("ERROR", errorMessage, data: {"email": email});
      
      print(errorMessage);
      return null;
    }
    
    try {
      final user = await _datasource.fetchUserByEmail(email);
      
      if (user != null) {
        await appLogger.log("INFO", "Fetched user by email successfully.", data: {"email": email});
        return toEntity(user);
      } else {
        await appLogger.log("INFO", "No user found for the given email.", data: {"email": email});
        return null;
      }
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by email.", data: {
        "email": email,
        "error": e.toString(),
      });
      
      throw CustomException("Failed to fetch user by email", code: "FETCH_USER_BY_EMAIL_ERROR");
    }
  }

  @override
  Future<User?> fetchUserById(int id) async {
    final appLogger = await AppLogger.getInstance(); 
    if (id <= 0) {
      final errorMessage = "Invalid user ID. Please provide a valid ID.";
      
      // Log the error
      await appLogger.log("ERROR", errorMessage, data: {"id": id});
      
      print(errorMessage);
      return null;
    }

    try {
      final user = await _datasource.fetchUserById(id);
      
      if (user != null) {
        await appLogger.log("INFO", "Fetched user by ID successfully.", data: {"id": id});
        return toEntity(user);
      } else {
        await appLogger.log("INFO", "No user found for the given ID.", data: {"id": id});
        return null;
      }
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by ID.", data: {
        "id": id,
        "error": e.toString(),
      });
      
      throw CustomException("Failed to fetch user by ID", code: "FETCH_USER_BY_ID_ERROR");
    }
  }

  @override
  Future<void> addUser(User user) async {
    final appLogger = await AppLogger.getInstance(); 

    if (user.username.isEmpty || user.email.isEmpty || user.hashedPassword.isEmpty) {
      final errorMessage = "Cannot add user. One or more required fields are empty.";
      
      await appLogger.log("ERROR", errorMessage, data: {
        "username": user.username,
        "email": user.email,
      });
      
      print(errorMessage);
      return;
    }

    try {
      final userModel = UserModel(
        username: user.username,
        email: user.email,
        hashedPassword: user.hashedPassword,
      );

      await _datasource.addUser(userModel);
      await appLogger.log("INFO", "User added successfully.", data: {
        "username": user.username,
        "email": user.email,
      });
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add user.", data: {
        "username": user.username,
        "email": user.email,
        "error": e.toString(),
      });
      throw CustomException("Failed to add user", code: "ADD_USER_ERROR");
    }
  }

  @override
  Future<bool> updateUser(User user, String username) async {
    final appLogger = await AppLogger.getInstance();

    if (user.username.isEmpty || user.email.isEmpty) {
      final errorMessage = "Cannot update user. One or more required fields are empty.";
      
      // Log the error
      await appLogger.log("ERROR", errorMessage, data: {
        "username": user.username,
        "email": user.email,
      });
      
      print(errorMessage);
      return false;
    }

    try {
      final userModel = UserModel(
        username: user.username,
        email: user.email,
        hashedPassword: user.hashedPassword,
      );
      await appLogger.log("INFO", "User update initiated.", data: {"username": username});
      await _datasource.updateUser(userModel, username);
      await appLogger.log("INFO", "User updated successfully.", data: {"username": username});
      return true;
    } catch (e) {

      await appLogger.log("ERROR", "Failed to update user.", data: {
        "username": username,
        "error": e.toString(),
      });

      throw CustomException("Failed to update user", code: "UPDATE_USER_ERROR");
    }
  }

  @override
  Future<bool> checkUserCredentials(String username, String password) async {
    final appLogger = await AppLogger.getInstance(); // Initialize the logger
    try {
      final result = await _datasource.checkUserCredentials(username, password);
      await appLogger.log("INFO", "User credentials check completed.", data: {
        "username": username,
      });

      return result;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to check user credentials.", data: {
        "username": username,
        "error": e.toString(),
      });

      throw CustomException("Failed to check user credentials", code: "CHECK_CREDENTIALS_ERROR");
    }
  }

  User toEntity(UserModel model) {
    return User(
      username: model.username,
      email: model.email,
      hashedPassword: model.hashedPassword,
    );
  }
}
