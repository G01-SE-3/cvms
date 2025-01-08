import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '../../../core/loggers/app_logger.dart';
import '../../../core/exceptions/custom_exception.dart';

class GetAllUsers {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);

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
