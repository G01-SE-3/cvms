import 'package:cvms/domain/usecases/user/get_user_details.dart';
import 'package:cvms/domain/usecases/user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:cvms/domain/entities/user/user.dart';

class UserController extends ChangeNotifier {
  final GetUserDetails getUserDetails;
  final AddUser addUser;

  User? user;
  bool isLoading = false;
  String? errorMessage;

  UserController({
    required this.getUserDetails,
    required this.addUser,
  });

  // Load a single user by ID
  Future<void> loadUser(int userId) async {
    if (user != null) return; 
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

/*Future<void> addNewUser(User userData) async {
  isLoading = true;
  notifyListeners();

  try {
    // Convert User entity to UserModel before passing it to the AddUser call method
    final userModel = UserModel(
      username: userData.username,
      email: userData.email,
      hashedPassword: userData.hashedPassword,
    );

    await addUser(userModel); // Call AddUser's call method

    errorMessage = null;
  } catch (e) {
    errorMessage = e.toString();
  } finally {
    isLoading = false;
    notifyListeners();
  }
}

*/

  @override
  void dispose() {
    super.dispose();
  }
}
