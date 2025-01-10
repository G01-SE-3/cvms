/*`File Name: <user_repository.dart>
Purpose: 
-  The purpose of this file is to define an abstract class that outlines methods for handling user data operations.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> fetchUserById(int id); 
  Future<User?> fetchUserByEmail(String email);
  Future<User?> fetchUserByUsername(String username);
  Future<bool> checkUserCredentials(String username, String password);
  Future<void> addUser(User user);
  Future<bool> updateUser(User user,String username);
}
