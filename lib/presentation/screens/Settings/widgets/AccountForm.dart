import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cvms/presentation/screens/Settings/constants/Validations/validations.dart';
import 'package:cvms/presentation/screens/Settings/widgets/FormPasswordField.dart';
import 'package:cvms/presentation/screens/Settings/widgets/FormTextField.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/Account.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:cvms/domain/entities/user/user.dart';
import 'package:cvms/presentation/controllers/user/user_controller.dart';
import 'package:provider/provider.dart';

class AccountForm extends StatefulWidget {
  final String username;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool isChangingPassword;
  final VoidCallback onTogglePasswordChange;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const AccountForm({
    super.key,
    required this.username,
    required this.usernameController,
    required this.emailController,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.isChangingPassword,
    required this.onTogglePasswordChange,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? usernameError;
  String? emailError;
  String? currentPasswordError;
  String? newPasswordError;
  String? confirmPasswordError;

  TextEditingController password = TextEditingController();

  /// Hashes the password using SHA-256 encoding.
  /// This is used for password comparison and storage security.
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  /// Validates the form fields and updates error messages.
  /// If the password change is enabled, it also validates the password-related fields.
  bool validateInputs(String hashedPassword) {
    setState(() {
      usernameError = validateUsername(widget.usernameController.text);
      emailError = validateEmail(widget.emailController.text);

      if (widget.isChangingPassword) {
        // Validate current password if the user is changing it
        currentPasswordError = validateUserPassword(
          widget.currentPasswordController.text,
          hashedPassword,
        );
        if (currentPasswordError == null) {
          // Validate new password and confirm password fields
          newPasswordError =
              validatePassword(widget.newPasswordController.text);
          confirmPasswordError = validateConfirmPassword(
            widget.confirmPasswordController.text,
            widget.newPasswordController.text,
          );
        }
      }
    });
    return true;
  }

  /// Handles the confirm action: validates input, hashes the new password, 
  /// updates the user details, and triggers the onConfirm callback.
  void handleConfirm() async {
    final hashedCurrentPassword = hashPassword(password.text);

    validateInputs(hashedCurrentPassword);

    if (usernameError == null &&
        emailError == null &&
        currentPasswordError == null &&
        newPasswordError == null &&
        confirmPasswordError == null) {
      if (widget.newPasswordController.text.isNotEmpty) {
        // If password is updated, update the current password field with the new hashed password
        widget.currentPasswordController.text =
            hashPassword(widget.newPasswordController.text);
        widget.confirmPasswordController.text = '';
        widget.newPasswordController.text = '';
      }

      final updatedUser = User(
        username: widget.usernameController.text,
        email: widget.emailController.text,
        hashedPassword: widget.currentPasswordController.text,
      );

      // Update user details through UserController
      final userController = context.read<UserController>();
      await userController.updateUserDetails(updatedUser, widget.username);

      widget.onConfirm(); // Callback to confirm changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTextField(
            controller: widget.usernameController,
            label: AccountStrings.Username,
            errorText: usernameError,
          ),
          const SizedBox(height: 10),
          FormTextField(
            controller: widget.emailController,
            label: AccountStrings.Email,
            errorText: emailError,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: widget.onTogglePasswordChange, 
            child: Text(
              AccountStrings.ChangePassword,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          if (widget.isChangingPassword) ...[
            const SizedBox(height: 10),
            FormPasswordField(
              controller: password,
              label: AccountStrings.CurrentPassword,
              isVisible: _isCurrentPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                });
              },
              errorText: currentPasswordError,
            ),
            const SizedBox(height: 10),
            FormPasswordField(
              controller: widget.newPasswordController,
              label: AccountStrings.NewPassword,
              isVisible: _isNewPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _isNewPasswordVisible = !_isNewPasswordVisible;
                });
              },
              errorText: newPasswordError,
            ),
            const SizedBox(height: 10),
            FormPasswordField(
              controller: widget.confirmPasswordController,
              label: AccountStrings.ConfirmNewPassword,
              isVisible: _isConfirmPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              errorText: confirmPasswordError,
            ),
          ],
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customElevatedButton(
                  context: context,
                  onPressed: widget.onCancel, 
                  text: AccountStrings.Cancel,
                  icon: Icons.cancel,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 10),
                customElevatedButton(
                  context: context,
                  onPressed: handleConfirm, // Trigger the handleConfirm method on button press
                  text: AccountStrings.Confirm,
                  icon: Icons.check,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
