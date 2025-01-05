import 'package:cvms/domain/entities/user/user.dart';

class UserModel extends User {
  @override
  final String hashedPassword;

  UserModel({
    required super.username,
    required super.email,
    required this.hashedPassword,
  }) : super(
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
