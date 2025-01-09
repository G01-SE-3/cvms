import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customElevatedButton.dart';
import 'package:cvms/presentation/screens/Settings/widgets/ChangesSavedDialog.dart';
import 'package:cvms/presentation/screens/Settings/widgets/customSwitchListTile.dart';
import 'package:cvms/presentation/screens/Settings/constants/Strings/Languages.dart';
import 'package:cvms/data/shared_prefs/LanguageProvider.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  String _selectedLanguage = LanguagesStrings.English;

  @override
  void initState() {
    super.initState();
    // Load the current language from the provider
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    _selectedLanguage = languageProvider.currentLanguage;
  }

  void _changeLanguage(String languageCode) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    languageProvider.changeLanguage(languageCode);
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguagesStrings.Languages),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitchListTile(
              value: _selectedLanguage == 'ar',
              title: LanguagesStrings.Arabic,
              onChanged: (bool value) {
                if (value) {
                  _changeLanguage('ar'); // Arabic language code
                }
              },
            ),
            customSwitchListTile(
              value: _selectedLanguage == 'en',
              title: LanguagesStrings.English,
              onChanged: (bool value) {
                if (value) {
                  _changeLanguage('en'); // English language code
                }
              },
            ),
            customSwitchListTile(
              value: _selectedLanguage == 'fr',
              title: LanguagesStrings.French,
              onChanged: (bool value) {
                if (value) {
                  _changeLanguage('fr'); // French language code
                }
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: customElevatedButton(
                context: context,
                onPressed: () {
                  ChangesSavedDialog(context);
                  // Optionally, show a success message here
                },
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
