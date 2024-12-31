import 'package:cvms/presentation/screens/Settings/widgets/AccountForm.dart';
import 'package:cvms/presentation/screens/Settings/widgets/AccountList.dart';
import 'package:flutter/material.dart';
import '../constants/Strings/Account.dart';
import 'customElevatedButton.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isEditing = false;
  bool _isChangingPassword = false;

  final TextEditingController _usernameController = TextEditingController(text: 'JohnDoe123');
  final TextEditingController _emailController = TextEditingController(text: 'johndoe@example.com');
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
        title: const Text(AccountStrings.Account),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isEditing
            ? AccountForm(
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
