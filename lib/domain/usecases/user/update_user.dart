import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';
class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<bool> execute(User user, String username) async {
    final appLogger = await AppLogger.getInstance();

    if (user.username.isEmpty || user.email.isEmpty) {
      final errorMessage = "Cannot update user. One or more required fields are empty.";

      await appLogger.log("ERROR", errorMessage, data: {
        "username": user.username,
        "email": user.email,
      });

      
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
      // Log the error with potentially sensitive information (username, email)
      await appLogger.log("ERROR", "Failed to update user.", data: {
        "username": user.username,
        "email": user.email,
        "error": e.toString(),
      });

      // Throwing a custom exception is good practice, but it might help to include more context
      throw CustomException("Failed to update user", code: "UPDATE_USER_ERROR");
    }
  }
}
