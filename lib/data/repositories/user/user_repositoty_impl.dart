/*

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<User?> fetchUserById(int id) async {
    final data = await dataSource.fetchUserById(id);
    if (data.isNotEmpty) {
      final model = UserModel.fromMap(data);
      return User(
        id: model.id,
        username: model.username,
        email: model.email,
      );
    }
    return null;
  }

  @override
  Future<void> addUser(User user, String hashedPassword) async {
    await dataSource.addUser({
      'username': user.username,
      'email': user.email,
      'hashedPassword': hashedPassword,
    });
  }
}
*/