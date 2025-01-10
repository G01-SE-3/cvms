/*
File Name: <individual_offender_repository.dart>
Purpose: < Implements the individual offender repository interface to handle CRUD operations and data management for individual offender entities.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved

*/import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';
import 'package:cvms/data/datasources/individual_offender/individual_offender_datasource.dart';
import 'package:cvms/data/models/individual_offender/individual_offender_model.dart';
import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import 'package:cvms/domain/entities/rc/register_number_entity.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class IndividualOffenderRepositoryImpl implements IndividualOffenderRepository {
  final IndividualOffenderDataSource _datasource;
  final RegisterNumberRepository _registerNumberRepository;

  IndividualOffenderRepositoryImpl(this._datasource, this._registerNumberRepository);

  @override
  Future<IndividualOffender> addIndividualOffender(IndividualOffender offender) async {
    final appLogger = await AppLogger.getInstance();
    try {
      final offenderModel = IndividualOffenderModel(
        individual_id: offender.individual_id,
        name: offender.name,
        surname: offender.surname,
        date_of_birth: offender.date_of_birth,
        place_of_birth: offender.place_of_birth,
        birth_certificate_number: offender.birth_certificate_number,
        mother_name: offender.mother_name,
        mother_surname: offender.mother_surname,
        father_name: offender.father_name,
        address: offender.address,
        business_address: offender.business_address,
      );

      final addedOffender = await _datasource.addIndividualOffender(offenderModel);

      await appLogger.log("INFO", "Added individual offender successfully.");

      return IndividualOffender(
        individual_id: addedOffender.individual_id,
        name: addedOffender.name,
        surname: addedOffender.surname,
        date_of_birth: addedOffender.date_of_birth,
        place_of_birth: addedOffender.place_of_birth,
        birth_certificate_number: addedOffender.birth_certificate_number,
        mother_name: addedOffender.mother_name,
        mother_surname: addedOffender.mother_surname,
        father_name: addedOffender.father_name,
        address: addedOffender.address,
        business_address: addedOffender.business_address,
      );
    } catch (e) {
      await appLogger.log("ERROR", "Failed to add individual offender.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to add individual offender", code: "ADD_INDIVIDUAL_OFFENDER_ERROR");
    }
  }

  @override
  Future<void> editIndividualOffender(IndividualOffender offender, RegisterNumberEntity registerNumber) async {
    final appLogger = await AppLogger.getInstance();
    try {
      final offenderModel = IndividualOffenderModel(
        individual_id: offender.individual_id,
        name: offender.name,
        surname: offender.surname,
        date_of_birth: offender.date_of_birth,
        place_of_birth: offender.place_of_birth,
        birth_certificate_number: offender.birth_certificate_number,
        mother_name: offender.mother_name,
        mother_surname: offender.mother_surname,
        father_name: offender.father_name,
        address: offender.address,
        business_address: offender.business_address,
      );

      await _datasource.updateIndividualOffender(offender.individual_id, offenderModel);
      await _registerNumberRepository.updateRegisterNumber(registerNumber);

      await appLogger.log("INFO", "Updated individual offender successfully.");
    } catch (e) {
      await appLogger.log("ERROR", "Failed to update individual offender.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to edit individual offender", code: "EDIT_INDIVIDUAL_OFFENDER_ERROR");
    }
  }

  @override
  Future<void> deleteIndividualOffender(int individualId) async {
    final appLogger = await AppLogger.getInstance();
    try {
      await _datasource.deleteIndividualOffender(individualId);
      await _registerNumberRepository.deleteRegisterNumber(individualId);

      await appLogger.log("INFO", "Deleted individual offender successfully.");
    } catch (e) {
      await appLogger.log("ERROR", "Failed to delete individual offender.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to delete individual offender", code: "DELETE_INDIVIDUAL_OFFENDER_ERROR");
    }
  }

  @override
  Future<List<IndividualOffender>> fetchAllIndividualOffenders() async {
    final appLogger = await AppLogger.getInstance();
    try {
      final offenderModels = await _datasource.fetchAllIndividualOffenders();

      await appLogger.log("INFO", "Fetched all individual offenders successfully.");

      return offenderModels.map((model) {
        return IndividualOffender(
          individual_id: model.individual_id,
          name: model.name,
          surname: model.surname,
          date_of_birth: model.date_of_birth,
          place_of_birth: model.place_of_birth,
          birth_certificate_number: model.birth_certificate_number,
          mother_name: model.mother_name,
          mother_surname: model.mother_surname,
          father_name: model.father_name,
          address: model.address,
          business_address: model.business_address,
        );
      }).toList();
    } catch (e) {
      await appLogger.log("ERROR", "Failed to fetch individual offenders.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to fetch individual offenders", code: "FETCH_INDIVIDUAL_OFFENDERS_ERROR");
    }
  }

  @override
  Future<BusinessOffenderModel?> fetchIndividualOffenderById(int id) {
    throw UnimplementedError();
  }
}
