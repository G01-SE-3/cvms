import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/Settings/widgets/ChangesSavedDialog.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customSwitchListTile.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/Languages.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  String _selectedLanguage = LanguagesStrings.English;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguagesStrings.Languages),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitchListTile(
              value: _selectedLanguage == LanguagesStrings.Arabic,
              title: LanguagesStrings.Arabic,
              onChanged: (bool value) {
                if (value) {
                  setState(() {
                    _selectedLanguage = LanguagesStrings.Arabic;
                  });
                }
              },
            ),
            customSwitchListTile(
              value: _selectedLanguage == LanguagesStrings.English,
              title: LanguagesStrings.English,
              onChanged: (bool value) {
                if (value) {
                  setState(() {
                    _selectedLanguage = LanguagesStrings.English;
                  });
                }
              },
            ),
            customSwitchListTile(
              value: _selectedLanguage == LanguagesStrings.French,
              title: LanguagesStrings.French,
              onChanged: (bool value) {
                if (value) {
                  setState(() {
                    _selectedLanguage = LanguagesStrings.French;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: customElevatedButton(
                context: context,
                onPressed: () => ChangesSavedDialog(context),
                text: LanguagesStrings.SaveChanges,
                icon: Icons.save,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}