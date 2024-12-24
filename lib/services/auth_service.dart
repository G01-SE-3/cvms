import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final _secureStorage = const FlutterSecureStorage();
  bool _isSignedIn = false;

  AuthService() {
    _loadAuthStatus();
  }

  bool get isSignedIn => _isSignedIn;

  Future<void> _loadAuthStatus() async {
    final value = await _secureStorage.read(key: 'isSignedIn');
    _isSignedIn = value == 'true';
    notifyListeners();
  }

  Future<void> signIn() async {
    _isSignedIn = true;
    await _secureStorage.write(key: 'isSignedIn', value: 'true');
    notifyListeners();
  }

  Future<void> signOut() async {
    _isSignedIn = false;
    await _secureStorage.delete(key: 'isSignedIn');
    notifyListeners();
  }
}
