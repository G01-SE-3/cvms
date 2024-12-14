import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';

class GetUserDetails {
  final UserRepository userRepository;

  GetUserDetails(this.userRepository);

  Future<User?> execute(int userId) async {
    try {
      return await userRepository.fetchUserById(userId);
    } catch (e) {
      throw Exception("Failed to fetch user details: $e");
    }
  }
}
