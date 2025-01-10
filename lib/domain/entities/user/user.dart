/*`File Name: <user.dart>
Purpose: 
- The purpose of this file is to define the structure of a user entity for representing user data in the application.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

class User {
  final String username;
  final String email;
  final String hashedPassword; //hashPassword stored instead of password for security re

  User({
    required this.username,
    required this.email,
    required this.hashedPassword, 
  });

  String get getHashedPassword => hashedPassword;
}
