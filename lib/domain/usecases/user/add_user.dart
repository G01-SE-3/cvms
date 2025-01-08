import 'package:cvms/data/models/user/user_model.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import '/../domain/entities/user/user.dart';  
import 'package:cvms/core/loggers/app_logger.dart'; 
import 'package:cvms/core/exceptions/custom_exception.dart'; 

class AddUser {
  final UserRepository userRepository;

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
