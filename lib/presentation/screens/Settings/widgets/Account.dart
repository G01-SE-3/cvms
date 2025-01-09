import 'package:cvms/presentation/screens/Settings/constants/Strings/Account.dart';
import 'package:cvms/presentation/screens/Settings/widgets/AccountForm.dart';
import 'package:cvms/presentation/screens/Settings/widgets/AccountList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/user/user_controller.dart';
import 'package:cvms/services/auth_service.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isEditing = false;
  bool _isChangingPassword = false;

  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    // Access the logged-in username from AuthService
    final authService = Provider.of<AuthService>(context, listen: false);
    final username = authService.username;

    if (username != null) {
      final userController =
          Provider.of<UserController>(context, listen: false);

      final user = await userController.getUserByUsername.execute(username);

      if (user != null) {
        setState(() {
          _usernameController.text = user.username ?? '';
          _emailController.text = user.email ?? '';
          _currentPasswordController.text = user.hashedPassword ?? '';
        });
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AccountStrings.Account),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isEditing
            ? AccountForm(
                username: _usernameController.text,
                usernameController: _usernameController,
                emailController: _emailController,
                currentPasswordController: _currentPasswordController,
                newPasswordController: _newPasswordController,
                confirmPasswordController: _confirmPasswordController,
                isChangingPassword: _isChangingPassword,
                onTogglePasswordChange: () {
                  setState(() {
                    _isChangingPassword = !_isChangingPassword;
                  });
                },
                onCancel: () {
                  setState(() {
                    _isEditing = false;
                    _isChangingPassword = false;
                  });
                },
                onConfirm: () {
                  setState(() {
                    _isEditing = false;
                    _isChangingPassword = false;
                  });
                },
              )
            : ListWidget(
                usernameController: _usernameController,
                emailController: _emailController,
                onEdit: () {
                  setState(() {
                    _isEditing = true;
                  });
                },
              ),
      ),
    );
  }
}
