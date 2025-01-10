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
    // Load the current language from the provider.
    /// This ensures that when the page is loaded, the currently selected language is retrieved and set correctly from shared preferences.
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    _selectedLanguage = languageProvider.currentLanguage;
  }

  void _changeLanguage(String languageCode) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    // Change the language in the LanguageProvider.
    /// This updates the language in the provider, which is responsible for persisting the language preference.
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
            // Language selection switches for Arabic, English, and French.
            // These allow the user to toggle between different language options.
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
                  // Displays a dialog confirming that the changes have been saved.
                  ChangesSavedDialog(context);
                  // Optionally, show a success message here.
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
