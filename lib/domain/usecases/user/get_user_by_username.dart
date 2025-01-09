import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetUserByUsername {
  final UserRepository repository;

  GetUserByUsername(this.repository);

  Future<User?> execute(String username) async {
    final appLogger = await AppLogger.getInstance();

    try {
      return await repository.fetchUserByUsername(username);
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user by username.", data: {
        "username": username,
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch user by username", code: "GET_USER_ERROR");
    }
  }
}
