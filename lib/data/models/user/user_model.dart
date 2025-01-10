/*`File Name: <user_model.dart>
Purpose: 
- The purpose of this file is to define the UserModel class, representing a user with attributes and methods 
for mapping data between objects and the database.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

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
