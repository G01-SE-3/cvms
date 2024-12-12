/*

import '../../domain/entities/user.dart';

class UserModel extends User {
  final String hashedPassword;

  UserModel({
    required int id,
    required String username,
    required String email,
    required this.hashedPassword,
  }) : super(
          id: id,
          username: username,
          email: email,
        );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      hashedPassword: map['hashed_password'],
    );
  }
}
*/