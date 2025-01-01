
import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final VoidCallback onEdit;

  const ListWidget({
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
        ListTile(
          title: const Text('Username'),
          subtitle: Text(widget.usernameController.text),
        ),
        const Divider(),
        ListTile(
          title: const Text('Email'),
          subtitle: Text(widget.emailController.text),
        ),
        const Divider(),
        const ListTile(
          title: Text('Password'),
          subtitle: Text('********'),
        ),
        const Divider(),
        Center(
          child: customElevatedButton(
            context: context,
            onPressed: widget.onEdit,
            text: "Edit",
            icon: Icons.edit,
          ),
        ),
      ],
    );
  }
}
