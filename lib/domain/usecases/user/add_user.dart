import 'package:cvms/data/models/user/user_model.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';

import '/../domain/entities/user/user.dart';  

class AddUser {
  final UserRepository userRepository; 

  AddUser({required this.userRepository});

  Future<void> call(UserModel userModel) async {
    // Convert UserModel to UserEntity
    final userEntity = User(
      username: userModel.username,
      email: userModel.email,
      hashedPassword: userModel.getHashedPassword, 
    );


    await userRepository.addUser(userEntity); 
  }

}
