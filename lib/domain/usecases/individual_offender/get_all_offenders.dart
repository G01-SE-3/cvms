/*
File Name: <get_all_offenders.dart>
Purpose: <defines a use case for fetching all individual offenders from the repository.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class GetAllOffenders {
  final IndividualOffenderRepository repository;

  GetAllOffenders(this.repository);

  Future<List<IndividualOffender>> execute() async {
    final appLogger = await AppLogger.getInstance();

    try {
      final offenders = await repository.fetchAllIndividualOffenders();

      await appLogger.log("INFO", "Fetched all individual offenders.");

      return offenders;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch all individual offenders.", data: {
        "error": e.toString(),
      });

      throw CustomException("Failed to fetch all individual offenders", code: "FETCH_ALL_INDIVIDUAL_OFFENDERS_ERROR");
    }
  }
}
