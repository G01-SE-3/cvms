/*
File Name: main.dart
Purpose: This file contains the implementation of the main app widget

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/

import 'package:cvms/domain/usecases/pv/delete_pv.dart';
import 'package:cvms/domain/usecases/pv/search_pv.dart';
import 'package:cvms/domain/usecases/pv/update_pv.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byDate.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byLatest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/services/auth_service.dart';
import 'package:cvms/core/loggers/app_logger.dart';
import 'data/repositories/user/user_repositoty_impl.dart';
import 'domain/usecases/pv/TotalPvCount.dart';
import 'domain/usecases/pv/monthlyPvCount.dart';
import 'domain/usecases/user/add_user.dart';
import 'domain/usecases/user/get_user_by_username.dart';
import 'domain/usecases/user/get_user_details.dart';
import 'domain/usecases/user/update_user.dart';
import 'presentation/controllers/user/user_controller.dart';
import 'package:cvms/data/shared_prefs/LanguageProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cvms/routes/app_routes.dart';

void main() async {
  // Ensure Flutter framework bindings are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize shared preferences for storing persistent app settings.
  final prefs = await SharedPreferences.getInstance();
  // Set default language to French if not already set.
  prefs.setString('language', 'fr');
  String languageCode = prefs.getString('language') ?? 'fr';

  // Initialize and update the language provider with the stored language.
  final languageProvider = LanguageProvider();
  languageProvider.changeLanguage(languageCode);

  // Initialize the application logger and log a startup message.
  final logger = (await AppLogger.getInstance()).logger;
  await logger.log(
    "INFO",
    "Application has started successfully.",
    data: {"timestamp": DateTime.now().toIso8601String()},
  );

  // Initialize repositories for handling data storage and operations.
  final pvRepository = PVRepositoryImpl(PVDataSource());

  // Use case instances for PV (process-verbal) operations.
  final getPVDetails = GetPVDetails(pvRepository);
  final getAllPVs = GetAllPVs(pvRepository);
  final insertPV = InsertPV(pvRepository);
  final searchPV = GetPVsByNumber(pvRepository);
  final getLatestPVs = GetLatestPVs(pvRepository);
  final getPVsByDate = GetPVsByDate(pvRepository);
  final deletePV = DeletePV(pvRepository);
  final updatePV = UpdatePV(pvRepository);
  final MonthlyPVCounts = GetMonthlyPVCounts(pvRepository);
  final totalPVCount = TotalPVCount(pvRepository);

  // Initialize repositories and use cases for user management.
  final userRepository = UserRepositoryImpl();
  final getUserDetails = GetUserDetails(userRepository);
  final getUserByUsername = GetUserByUsername(userRepository);
  final addUser = AddUser(userRepository: userRepository);
  final updateUser = UpdateUser(userRepository);

  // Run the Flutter application with dependency injection using MultiProvider.
  runApp(
    MultiProvider(
      providers: [
        // Provide authentication service to the app.
        ChangeNotifierProvider(create: (context) => AuthService()),

        // Provide the language provider to handle language changes.
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => languageProvider),

        // Provide the PV controller with all necessary use cases for managing PVs.
        ChangeNotifierProvider<PVController>(
          create: (context) => PVController(
            getPVDetails: getPVDetails,
            getAllPVs: getAllPVs,
            insertPV: insertPV,
            searchPV: searchPV,
            getLatestPVs: getLatestPVs,
            getPVsByDate: getPVsByDate,
            deletePV: deletePV,
            updatePV: updatePV,
            MonthlyPVCounts: MonthlyPVCounts,
            TotalpVCount: totalPVCount,
          ),
        ),

        // Provide the user controller with all necessary use cases for user management.
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(
            getUserDetails: getUserDetails,
            getUserByUsername: getUserByUsername,
            addUser: addUser,
            updateUser: updateUser,
          ),
        ),
      ],
      // The root widget of the application.
      child: const MyApp(),
    ),
  );
}

// Main app widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App title displayed in the system's app switcher or window title (on web/desktop).
      title: 'CVMS App',

      // Define the default theme for the application.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // The default home screen of the application.
      home: const LoginPage(),

      // Define the route mappings for navigation.
      routes: AppRoutes.getRoutes(),

      // Handle unknown routes by redirecting to the login page.
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
