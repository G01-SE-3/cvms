import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor now includes the named 'key' parameter
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello to CVMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // Passing 'key' to MyHomePage widget
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Constructor now includes the named 'key' parameter
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello to CVMS'),
      ),
      body: const Center(
        child: Text(
          'Hello to CVMS',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
