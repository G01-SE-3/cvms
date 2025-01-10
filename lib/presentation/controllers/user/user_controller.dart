/*`File Name: <user_controller.dart>
Purpose: 
-  The purpose of this file is to implement the controller for handling user-related operations, 
such as loading, updating, and adding users, and managing the state for UI updates.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:flutter/material.dart';
import 'package:cvms/domain/usecases/user/get_user_details.dart';
import 'package:cvms/domain/usecases/user/add_user.dart';
import 'package:cvms/domain/usecases/user/get_user_by_username.dart';
import 'package:cvms/domain/usecases/user/update_user.dart'; 
import 'package:cvms/domain/entities/user/user.dart';

class UserController extends ChangeNotifier {
  final GetUserDetails getUserDetails;
  final AddUser addUser;
  final GetUserByUsername getUserByUsername;
  final UpdateUser updateUser; 

  User? user;
  bool isLoading = false;
  String? errorMessage;

  UserController({
    required this.getUserDetails,
    required this.addUser,
    required this.getUserByUsername,
    required this.updateUser, 
  });

  // Load a single user by ID
  Future<void> loadUser(int userId) async {
    if (user != null) return;
    isLoading = true;
    notifyListeners();

    try {
      user = await getUserDetails.execute(userId);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      user = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Load a user by username
  Future<void> loadUserByUsername(String username) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await getUserByUsername.execute(username);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      user = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

 Future<bool> updateUserDetails(User user,String username) async {
    try {
      print("Attempting to update user: ${user.username}, ${user.email},${user.hashedPassword}");
      
      await updateUser.execute(user,username );  // This should just execute, no result expected
      print("User updated successfully");
      notifyListeners();  
      return true;// Notify listeners if you want the UI to update
    } catch (e) {
      print("Error in UserController update: $e");
      return false; 
     
    }

  }

}

