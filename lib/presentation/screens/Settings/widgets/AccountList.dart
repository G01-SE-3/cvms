import 'package:cvms/presentation/screens/Settings/constants/Strings/AccountList.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final VoidCallback onEdit;

  const ListWidget({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.onEdit,
  });

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Display username with the value from usernameController
        ListTile(
          title: Text(ListWidgetStrings.username),
          subtitle: Text(widget.usernameController.text),
        ),
        const Divider(),
        // Display email with the value from emailController
        ListTile(
          title: Text(ListWidgetStrings.email),
          subtitle: Text(widget.emailController.text),
        ),
        const Divider(),
        // Display a masked password for security purposes
        ListTile(
          title: Text(ListWidgetStrings.password),
          subtitle: Text(ListWidgetStrings.hiddenPassword),
        ),
        const Divider(),
        // Edit button that triggers the onEdit callback when pressed
        Center(
          child: customElevatedButton(
            context: context,
            onPressed: widget.onEdit, // This triggers the onEdit method passed from parent widget
            text: ListWidgetStrings.editButtonText,
            icon: Icons.edit,
          ),
        ),
      ],
    );
  }
}
