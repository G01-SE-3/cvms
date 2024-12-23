import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';
import 'package:cvms/services/auth_service.dart';
import 'package:cvms/presentation/screens/homepage/homepage.dart';

void main() {
  final pvRepository = PVRepositoryImpl(PVDataSource());
  final getPVDetails = GetPVDetails(pvRepository);
  final getAllPVs = GetAllPVs(pvRepository);
  final insertPV = InsertPV(pvRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthService()), 
        ChangeNotifierProvider<PVController>(
          create: (context) => PVController(
            getPVDetails: getPVDetails,
            getAllPVs: getAllPVs,
            insertPV: insertPV,
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access AuthService using Provider
    final authService = Provider.of<AuthService>(context);

    return MaterialApp(
      title: 'CVMS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authService.isSignedIn
          ? const HomePage() 
          : const LoginPage(), 
      routes: {
        '/pvs': (context) => PVListPage(),
        '/inspectors': (context) => InspectorsListPage(),
        '/business_offender': (context) => BusinessOffenderList(),
        '/individual_offender': (context) => IndividualOffenderList(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }
}
