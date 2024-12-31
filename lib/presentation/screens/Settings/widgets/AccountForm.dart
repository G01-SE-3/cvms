import 'package:cvms/presentation/screens/Settings/constants/Strings/Account.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:flutter/material.dart';

class AccountForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final bool isChangingPassword;
  final VoidCallback onTogglePasswordChange;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  // Fixed constructor name to match usage
  const AccountForm({
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: usernameController,
          decoration: const InputDecoration(labelText: AccountStrings.Username),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: AccountStrings.Email),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTogglePasswordChange,
          child: const Text(
            AccountStrings.ChangePassword,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        if (isChangingPassword) ...[
          const SizedBox(height: 10),
          TextField(
            controller: currentPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: AccountStrings.CurrentPassword),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: AccountStrings.NewPassword),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: AccountStrings.ConfirmNewPassword),
          ),
        ],
        const SizedBox(height: 20),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customElevatedButton(
                context: context,
                onPressed: onCancel,
                text: AccountStrings.Cancel,
                icon: Icons.cancel,
                backgroundColor: Colors.red,
              ),
              const SizedBox(width: 10),
              customElevatedButton(
                context: context,
                onPressed: onConfirm,
                text: AccountStrings.Confirm,
                icon: Icons.check,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
