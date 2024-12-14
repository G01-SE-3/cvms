import 'package:flutter/material.dart';
import 'core/utils/get_db.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Database Connection Test'),
        ),
        body: Center(
          child: Text('Check your console for the DB connection status!'),
        ),
      ),
    );
  }
}
