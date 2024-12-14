import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: TO BE FIXED, DOES NOT WORK PROPERLY
class AuthService with ChangeNotifier {
  bool _isSignedIn = false;

  AuthService() {
    _loadAuthStatus();
  }

  bool get isSignedIn => _isSignedIn;

  Future<void> _loadAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isSignedIn = prefs.getBool('isSignedIn') ?? false; // Load the saved state
    notifyListeners();
  }

  Future<void> signIn() async {
    // Perform sign-in logic here
    _isSignedIn = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', true); // Save the state
    notifyListeners();
  }

  Future<void> signOut() async {
    // Perform sign-out logic here
    _isSignedIn = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false); // Save the state
    notifyListeners();
  }
}
