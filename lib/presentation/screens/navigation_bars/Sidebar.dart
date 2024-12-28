import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/navigation_bars/constants/Strings/Sidebar.dart';
import 'package:provider/provider.dart'; // Import for accessing AuthService

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF4A4A31), // Background color
        child: Column(
          children: [
            // Top space
            const SizedBox(height: 50),
            // Top menu items
            Expanded(
              child: Column(
                children: sidebarItemsTop(context),
              ),
            ),
            // Bottom menu items
            Column(
              children: [
                ...sidebarItemsBottom(context),
                // Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    // Call signOut from AuthService to clear authentication data
                    final authService = Provider.of<AuthService>(context, listen: false);
                    await authService.signOut();

                    // Navigate to login screen and clear the navigation stack
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
