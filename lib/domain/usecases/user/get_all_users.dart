import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';

class GetAllUsers {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);

  Future<List<User>> execute() async {
    return await userRepository.getAllUsers();
  }
}
