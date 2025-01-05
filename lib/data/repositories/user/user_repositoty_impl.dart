
import 'package:cvms/data/datasources/user/user_datasource.dart';
import 'package:cvms/domain/repositories/user/user_repository.dart';
import 'package:cvms/data/models/user/user_model.dart';
import 'package:cvms/domain/entities/user/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _datasource = UserDataSource();

  @override
  Future<List<User>> getAllUsers() async {
    final users = await _datasource.fetchAllUsers();
    return users.map((model) => toEntity(model)).toList();
  }

  // Fetch user by username
  @override
  Future<User?> fetchUserByUsername(String username) async {
    if (username.isEmpty) {
      print("Username is empty. Please provide a valid username.");
      return null;
    }

    final user = await _datasource.fetchUserByUsername(username);
    return user != null ? toEntity(user) : null;
  }

  // Fetch user by email
  @override
  Future<User?> fetchUserByEmail(String email) async {
    if (email.isEmpty) {
      print("Email is empty. Please provide a valid email.");
      return null;
    }

    final user = await _datasource.fetchUserByEmail(email);
    return user != null ? toEntity(user) : null;
  }

  // Fetch user by ID
  @override
  Future<User?> fetchUserById(int id) async {
    if (id <= 0) {
      print("Invalid user ID. Please provide a valid ID.");
      return null;
    }

    final user = await _datasource.fetchUserById(id);
    return user != null ? toEntity(user) : null;
  }


  /// Add new user
  @override
  Future<void> addUser(User user) async {
    if (user.username.isEmpty || user.email.isEmpty || user.hashedPassword.isEmpty) {
      print("Cannot add user. One or more required fields are empty.");
      return;
    }
    
    final userModel = UserModel(
      username: user.username,
      email: user.email,
      hashedPassword: user.hashedPassword,
    );
    
    await _datasource.addUser(userModel);
  }

  // Update user
  @override
  Future<bool> updateUser(User user,String username) async {
    if (user.username.isEmpty || user.email.isEmpty) {
      print("Cannot update user. One or more required fields are empty.");
      return false;
    }

    final userModel = UserModel(
      username: user.username,
      email: user.email,
      hashedPassword: user.hashedPassword,
    );
    print('user updated successfully');

    await _datasource.updateUser(userModel,username);
    return true;
  }

  @override
  Future<bool> checkUserCredentials(String username, String password) async {
    return await _datasource.checkUserCredentials(username, password);
  }

  User toEntity(UserModel model) {
    return User(
      username: model.username,
      email: model.email,
      hashedPassword: model.hashedPassword,
    );
  }
}
