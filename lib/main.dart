import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/EconomicOperatorDetails/EconomicOperatorDetails.dart';
import 'package:flutter/material.dart';
import 'core/utils/get_db.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Database Connection Test'),
        ),
        body: IndividualOffenderList(),
        /*const Center(
          child: Text('Check your console for the DB connection status!'),
        ),*/
      ),
    );
  }
}
