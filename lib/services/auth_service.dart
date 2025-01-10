/*`File Name: <auth_service.dart>
Purpose: 
- The purpose of this file is to manage user authentication, including sign-in, sign-out, and storing credentials securely
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

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

/// Loads the authentication status from secure storage and updates the [isSignedIn] property.
/// This method is asynchronous and retrieves the sign-in status to determine if the user is signed in.
/// It then notifies listeners of the change in authentication status.
/// 
/// Throws a [StorageException] if the read operation fails.

  Future<void> _loadAuthStatus() async {
    final value = await _secureStorage.read(key: 'isSignedIn');
    _isSignedIn = value == 'true';
    notifyListeners();
  }

/// Loads the username from secure storage and updates the [username] property.
/// This method is asynchronous and retrieves the username to be used for authentication.
/// It then notifies listeners of the change in the username.
/// 
/// Throws a [StorageException] if the read operation fails.

  Future<void> _loadUsername() async {
    _username = await _secureStorage.read(key: 'username');
    notifyListeners();
  }

// Signs in a user by storing their username and sign-in status securely.
/// This method is asynchronous and updates the sign-in status and username
/// in secure storage while notifying listeners of the change.
/// 
/// Throws a [StorageException] if the storage operation fails.

  Future<void> signIn(String username) async {
    _isSignedIn = true;
    _username = username;

    // Store the sign-in status and username in secure storage
    await _secureStorage.write(key: 'isSignedIn', value: 'true');
    await _secureStorage.write(key: 'username', value: username);

    notifyListeners();
  }

/// Signs out the current user by removing their username and sign-in status from secure storage.
/// This method is asynchronous and updates the sign-in status by removing the stored values
/// and notifying listeners of the change.
/// 
/// Throws a [StorageException] if the removal operation fails.

  Future<void> signOut() async {
    _isSignedIn = false;
    _username = null;

    // Remove the sign-in status and username from secure storage
    await _secureStorage.delete(key: 'isSignedIn');
    await _secureStorage.delete(key: 'username');

    notifyListeners();
  }
}
