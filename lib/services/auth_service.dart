import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final _secureStorage = const FlutterSecureStorage();
  bool _isSignedIn = false;
  String? _username;

  AuthService() {
    _loadAuthStatus();
    _loadUsername();
  }

  bool get isSignedIn => _isSignedIn;
  String? get username => _username;

  Future<void> _loadAuthStatus() async {
    final value = await _secureStorage.read(key: 'isSignedIn');
    _isSignedIn = value == 'true';
    notifyListeners();
  }

  Future<void> _loadUsername() async {
    _username = await _secureStorage.read(key: 'username');
    notifyListeners();
  }

  Future<void> signIn(String username) async {
    _isSignedIn = true;
    _username = username;

    // Store the sign-in status and username in secure storage
    await _secureStorage.write(key: 'isSignedIn', value: 'true');
    await _secureStorage.write(key: 'username', value: username);

    notifyListeners();
  }

  Future<void> signOut() async {
    _isSignedIn = false;
    _username = null;

    // Remove the sign-in status and username from secure storage
    await _secureStorage.delete(key: 'isSignedIn');
    await _secureStorage.delete(key: 'username');

    notifyListeners();
  }
}
