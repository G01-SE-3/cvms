import 'package:cvms/data/models/user/user_model.dart';
import '../database_helper.dart';


class UserDataSource {

  // Fetch all users
  Future<List<UserModel>> fetchAllUsers() async {
    final connection = await DatabaseHelper().connection;  // Get the singleton connection
    final results = await connection.query('SELECT * FROM users');

    List<UserModel> users = [];
    for (var row in results) {
      users.add(UserModel.fromMap(row.toColumnMap()));
    }
    return users;
  }

  // Fetch user by username
  Future<UserModel?> fetchUserByUsername(String username) async {
  if (username.isEmpty) {
    print("Username is empty.");
    return null;
  }

  final connection = await DatabaseHelper().connection;  // Get the singleton connection
  final result = await connection.query(
    'SELECT * FROM users WHERE username = @username',
    substitutionValues: {'username': username},
  );

  if (result.isNotEmpty) {
    final row = result.first.toColumnMap();  // Convert row to map

    // Ensure correct types when creating UserModel
    return UserModel(
      username: row['username'], // Use the actual column name 'username'
      email: row['email'],       // Use the actual column name 'email'
      hashedPassword: row['password'], // Use the actual column name 'password'
    );
  }

  print("User with username $username not found.");
  return null;
}


  // Fetch user by email
  Future<UserModel?> fetchUserByEmail(String email) async {
    if (email.isEmpty) {
      print("Email is empty.");
      return null;
    }

    final connection = await DatabaseHelper().connection;  // Get the singleton connection
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

  // Fetch user by ID
  Future<UserModel?> fetchUserById(int id) async {
    if (id <= 0) {
      print("Invalid user ID.");
      return null;
    }

    final connection = await DatabaseHelper().connection;  // Get the singleton connection
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

  // Check if user exists by username and password
  Future<bool> checkUserCredentials(String username, String password) async {
    final connection = await DatabaseHelper().connection;  // Get the singleton connection
    final result = await connection.query(
      'SELECT * FROM users WHERE username = @username AND password = @password',
      substitutionValues: {
        'username': username,
        'password': password,
      },
    );

    return result.isNotEmpty;
  }

  // Add a new user
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

  // Update user details
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
