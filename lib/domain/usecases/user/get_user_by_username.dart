import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';



class GetUserByUsername {
  final UserRepository repository;

  GetUserByUsername(this.repository);

  Future<User?> execute(String username) async {
    return await repository.fetchUserByUsername(username);
  }
}
