/*
File Name: <add_offender.dart>
Purpose: <Handles the addition of a new offender to the repository in the business domain.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class AddOffender {
  final BusinessOffenderRepository repository;

  AddOffender(this.repository);

  Future<BusinessOffender> execute(BusinessOffender offender) async {
    final appLogger = await AppLogger.getInstance();

    try {
      final addedOffender = await repository.addOffender(offender);

      await appLogger.log("INFO", "Business offender added successfully.", data: {
        "offender": offender.toString(),
      });

      return addedOffender;
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add business offender.", data: {
        "offender": offender.toString(),
        "error": e.toString(),
      });

      throw CustomException("Failed to add business offender", code: "ADD_OFFENDER_ERROR");
    }
  }
}
