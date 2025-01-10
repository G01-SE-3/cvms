/*`File Name: <user_datasource.dart>
Purpose: 
- The purpose of this file is to manage user data operations, including fetching, adding, updating, and verifying users in the database.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/data/models/user/user_model.dart';
import '../database_helper.dart';


class UserDataSource {

/// Fetches all users from the database.
/// This method is asynchronous and returns a list of [UserModel] objects.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.
  
  Future<List<UserModel>> fetchAllUsers() async {
    final connection = await DatabaseHelper().connection;  
    final results = await connection.query('SELECT * FROM users');

    List<UserModel> users = [];
    for (var row in results) {
      users.add(UserModel.fromMap(row.toColumnMap()));
    }
    return users;
  }

/// Fetches a user from the database by their username.
/// This method is asynchronous and returns a [UserModel] object if found, or null if not.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<UserModel?> fetchUserByUsername(String username) async {
  if (username.isEmpty) {
    print("Username is empty.");
    return null;
  }

  final connection = await DatabaseHelper().connection;  
  final result = await connection.query(
    'SELECT * FROM users WHERE username = @username',
    substitutionValues: {'username': username},
  );

  if (result.isNotEmpty) {
    final row = result.first.toColumnMap();  

    return UserModel(
      username: row['username'], 
      email: row['email'],      
      hashedPassword: row['password'], 
    );
  }

  print("User with username $username not found.");
  return null;
}

/// Fetches a user from the database by their email.
/// This method is asynchronous and returns a [UserModel] object if found, or null if not.
/// 
/// Throws a [DatabaseException] if the fetch operation fails.

  Future<UserModel?> fetchUserByEmail(String email) async {
    if (email.isEmpty) {
      print("Email is empty.");
      return null;
    }

    final connection = await DatabaseHelper().connection;  
    final result = await connection.query(
      'SELECT * FROM users WHERE email = @email',
      substitutionValues: {'email': email},
    );

    if (result.isNotEmpty) {
      final row = result.first;
      return UserModel(
        username: row[0],
        email: row[1],
        hashedPassword: row[2],
      );
    }
    print("User with email $email not found.");
    return null;
  }

/// Fetches a user from the database by their user ID.
/// This method is asynchronous and returns a [UserModel] object if found, or null if not.
/// 
/// Throws a [DatabaseException] if the fetch operation fails or if the ID is invalid.

  Future<UserModel?> fetchUserById(int id) async {
    if (id <= 0) {
      print("Invalid user ID.");
      return null;
    }

    final connection = await DatabaseHelper().connection; 
    final result = await connection.query(
      'SELECT * FROM users WHERE user_id = @id',
      substitutionValues: {'id': id},
    );

    if (result.isNotEmpty) {
      final row = result.first;
      return UserModel(
        username: row[0],
        email: row[1],
        hashedPassword: row[2],
      );
    }
    print("User with ID $id not found.");
    return null;
  }

/// Checks if the provided username and password match a user in the database.
/// This method is asynchronous and returns a boolean indicating whether the credentials are valid.
/// 
/// Throws a [DatabaseException] if the query operation fails.

  Future<bool> checkUserCredentials(String username, String password) async {
    final connection = await DatabaseHelper().connection; 
    final result = await connection.query(
      'SELECT * FROM users WHERE username = @username AND password = @password',
      substitutionValues: {
        'username': username,
        'password': password,
      },
    );

    return result.isNotEmpty;
  }

/// Adds a new user to the database.
/// This method is asynchronous and executes an SQL query to insert the new user data.
/// 
/// Throws a [DatabaseException] if the insert operation fails.

  Future<void> addUser(UserModel user) async {
    if (user.username.isEmpty || user.email.isEmpty || user.hashedPassword.isEmpty) {
      print("Cannot add user. One or more required fields are empty.");
      return;
    }

    try {
      final connection = await DatabaseHelper().connection;  // Get the singleton connection
      print("Connection established: $connection");

      var result = await connection.query(
        'INSERT INTO users (username, email, password) VALUES (@username, @email, @password)',
        substitutionValues: {
          'username': user.username,
          'email': user.email,
          'password': user.hashedPassword
        },
      );

      if (result.isEmpty) {
        print("Query executed, but no rows affected.");
      } else {
        print("Query executed. User added successfully.");
      }

    } catch (e) {
      print("Error occurred during query: $e");
      rethrow;  
    }
  }

/// Updates an existing user's details in the database based on their username.
/// This method is asynchronous and executes an SQL query to update the user data.
/// 
/// Throws a [DatabaseException] if the update operation fails.

  Future<bool> updateUser(UserModel user,String username) async {
    if (user.username.isEmpty || user.email.isEmpty||user.hashedPassword.isEmpty) {
     //rise ecxeption
      return false;
    }

    final connection = await DatabaseHelper().connection;  // Get the singleton connection
    await connection.query(
      'UPDATE users SET username = @username, email = @email, password = @hashedPassword WHERE username  = @Username',
      substitutionValues: {
        'Username':username,
        'username': user.username,
        'email': user.email,
        'hashedPassword': user.hashedPassword
      },
    );

  
    return true;
  }
}
