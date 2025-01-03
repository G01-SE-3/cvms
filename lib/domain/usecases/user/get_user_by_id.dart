import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';



class GetUserByEmail {
  final UserRepository repository;

  GetUserByEmail(this.repository);

  Future<User?> execute(String email) async {
    return await repository.fetchUserByEmail(email);
  }
}