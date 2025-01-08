import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/loggers/app_logger.dart';
import '../../../core/exceptions/custom_exception.dart';

class GetUserByEmail {
  final UserRepository repository;

  GetUserByEmail(this.repository);

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
