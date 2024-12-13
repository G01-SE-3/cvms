/* TESTING THE PV DETAILS*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'presentation/screens/PV_details_page/PVPage.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GetPVDetails>(
          create: (_) => GetPVDetails(PVRepositoryImpl(PVDataSource())),
        ),
        ChangeNotifierProvider<PVController>(
          create: (context) => PVController(
            Provider.of<GetPVDetails>(context, listen: false),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PV Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to PVPage with a sample PV ID
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PVPage(pvId: '2024-001'),
              ),
            );
          },
          child: const Text('Go to PV Details'),
        ),
      ),
    );
  }
}
*/
/*
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';

void main() {
  // Initialize data source, repository, and use cases
  final pvDataSource = PVDataSource(); // Ensure this is correctly implemented
  final pvRepository = PVRepositoryImpl(pvDataSource);
  final getAllPVsUseCase = GetAllPVs(pvRepository);
  final getPVDetailsUseCase =
      GetPVDetails(pvRepository); // Create an instance of GetPVDetails

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PVController(
            insertPV: ,
            getPVDetails: getPVDetailsUseCase, // Pass the required argument
            getAllPVs: getAllPVsUseCase, // Pass the required argument
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PV List Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PVListPage(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart'; // Import your PVController
import 'package:cvms/presentation/screens/add_PV_form.dart/AddPVPage.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart'; // Adjust import based on actual path
import 'package:cvms/data/datasources/pv/pv_datasource.dart'; // Import your data source

void main() {
  // Initialize the required service or database client

  // Initialize the PVDataSource with the necessary services
  final pvDataSource = PVDataSource(); // Pass any required parameters here

  // Initialize the PVRepository with the data source
  final pvRepository = PVRepositoryImpl(pvDataSource);

  // Initialize the use cases with the repository
  final getAllPVsUseCase = GetAllPVs(pvRepository);
  final getPVDetailsUseCase = GetPVDetails(pvRepository);
  final insertPVUseCase = InsertPV(pvRepository);

  runApp(MyApp(
    getAllPVsUseCase: getAllPVsUseCase,
    getPVDetailsUseCase: getPVDetailsUseCase,
    insertPVUseCase: insertPVUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetAllPVs getAllPVsUseCase;
  final GetPVDetails getPVDetailsUseCase;
  final InsertPV insertPVUseCase;

  // Constructor to receive the use cases
  const MyApp({
    super.key,
    required this.getAllPVsUseCase,
    required this.getPVDetailsUseCase,
    required this.insertPVUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Providing the PVController here
        ChangeNotifierProvider(
          create: (_) => PVController(
            insertPV: insertPVUseCase,
            getPVDetails: getPVDetailsUseCase,
            getAllPVs: getAllPVsUseCase,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PV Management',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AddPVPage(), // Starting the AddPVPage as the home screen
      ),
    );
  }
}
