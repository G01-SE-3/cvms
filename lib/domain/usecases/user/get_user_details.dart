import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetUserDetails {
  final UserRepository userRepository;

  GetUserDetails(this.userRepository);

  Future<User?> execute(int userId) async {
    final appLogger = await AppLogger.getInstance();

    try {
      return await userRepository.fetchUserById(userId);
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch user details.", data: {
        "userId": userId,
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch user details", code: "GET_USER_ERROR");
    }
  }
}
