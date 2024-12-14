import 'package:cvms/presentation/screens/PV_details_page/PVPage.dart';
import 'package:cvms/presentation/screens/PVs_list_page/PVListPage.dart';
import 'package:flutter/material.dart';
import 'package:cvms/presentation/screens/add_PV_form/AddPVPage.dart';
import 'package:provider/provider.dart';
import 'package:cvms/presentation/controllers/pv/pv_controller.dart';
import 'package:cvms/data/repositories/pv/pv_repository_impl.dart';
import 'package:cvms/data/datasources/pv/pv_datasource.dart';
import 'package:cvms/domain/usecases/pv/get_all_pvs.dart';
import 'package:cvms/domain/usecases/pv/get_pv_details.dart';
import 'package:cvms/domain/usecases/pv/insert_pv.dart';
import 'package:cvms/presentation/screens/inspectors_list/inspectors_list.dart';
import 'package:cvms/presentation/screens/business_offender_form/BusinessOffenderForm.dart';
import 'package:cvms/presentation/screens/BusinessOffender/BusinessOffenderList.dart';
import 'package:cvms/presentation/screens/IndividualOffender/IndividualOffenderList.dart';
import 'package:cvms/presentation/screens/sign_up/SignUpPage.dart';
import 'package:cvms/presentation/screens/login/LoginPage.dart';

void main() {
  // Instantiate the required dependencies
  final pvRepository = PVRepositoryImpl(PVDataSource());
  final getPVDetails = GetPVDetails(pvRepository);
  final getAllPVs = GetAllPVs(pvRepository);
  final insertPV = InsertPV(pvRepository);

  runApp(
    MultiProvider(
      providers: [
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
    return MaterialApp(
      home: Scaffold(
        body: Center(child: LoginPage()),
      ),
    );
  }
}
