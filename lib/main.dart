import 'package:cvms/domain/usecases/pv/delete_pv.dart';
import 'package:cvms/domain/usecases/pv/search_pv.dart';
import 'package:cvms/domain/usecases/pv/update_pv.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byDate.dart';
import 'package:cvms/domain/usecases/pv/filter_pv_byLatest.dart';
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
import 'package:cvms/presentation/screens/homepage/homepage.dart';
import 'package:cvms/services/auth_service.dart';
import 'package:cvms/presentation/screens/login/widgets/LoginButton.dart';
import 'package:cvms/core/loggers/app_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Logger
  //
  final logger = (await AppLogger.getInstance()).logger;
  await logger.log(
    "INFO",
    "Application has started successfully.",
    data: {"timestamp": DateTime.now().toIso8601String()},
  );
  //
  final pvRepository = PVRepositoryImpl(PVDataSource());
  final getPVDetails = GetPVDetails(pvRepository);
  final getAllPVs = GetAllPVs(pvRepository);
  final insertPV = InsertPV(pvRepository);
  final searchPV = GetPVsByNumber(pvRepository);
  final getLatestPVs = GetLatestPVs(pvRepository);
  final getPVsByDate = GetPVsByDate(pvRepository);
  final deletePV = DeletePV(pvRepository);
  final updatePV = UpdatePV(pvRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider<PVController>(
          create: (context) => PVController(
              getPVDetails: getPVDetails,
              getAllPVs: getAllPVs,
              insertPV: insertPV,
              searchPV: searchPV,
              getLatestPVs: getLatestPVs,
              getPVsByDate: getPVsByDate,
              deletePV: deletePV,
              updatePV: updatePV),
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
      title: 'CVMS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        // TODO: Put the routes in their specified folder
        '/pvs': (context) => const PVListPage(),
        '/inspectors': (context) => const InspectorsListPage(),
        '/business_offender': (context) => const BusinessOffenderList(),
        '/individual_offender': (context) => const IndividualOffenderList(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => LoginPage(), // Fallback route
      ),
    );
  }
}
