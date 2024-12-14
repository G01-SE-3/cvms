import 'package:cvms/domain/entities/user/user.dart';

class UserModel extends User {
  final String hashedPassword;

  UserModel({
    required String username,
    required String email,
    required this.hashedPassword,
  }) : super(
          username: username,
          email: email,
          hashedPassword: hashedPassword,
        );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      hashedPassword: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': hashedPassword,
    };
  }
}
