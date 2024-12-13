import 'package:flutter/material.dart';
import 'core/utils/get_db.dart';
import 'presentation/screens/inspectors_list/inspectors_list.dart'; // Adjust the path as needed.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final dbConnection = await getDatabaseConnection();
    print("Database connected successfully!");
  } catch (e) {
    print("Database connection failed: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InspectorsListPage(),
    );
  }
}
