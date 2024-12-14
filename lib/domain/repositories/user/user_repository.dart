import 'package:cvms/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> fetchUserById(int id); 
  Future<User?> fetchUserByEmail(String email);
  Future<User?> fetchUserByUsername(String username);
  Future<bool> checkUserCredentials(String username, String password);
  Future<void> addUser(User user);
  Future<void> updateUser(User user);
}
