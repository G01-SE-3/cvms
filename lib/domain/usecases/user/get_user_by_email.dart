import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetUserByEmail {
  final UserRepository repository;

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
