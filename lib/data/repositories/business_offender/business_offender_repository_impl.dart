/*
File Name: <business_offender_repository.dart>
Purpose: < Implements the business offender repository interface to handle CRUD operations and data management for business offender entities.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/data/datasources/business_offender/business_offender_datasource.dart';
import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import 'package:cvms/domain/entities/rc/register_number_entity.dart';
import '../../../core/exceptions/custom_exception.dart';
import '../../../core/loggers/app_logger.dart';

class BusinessOffenderRepositoryImpl implements BusinessOffenderRepository {
  final BusinessOffenderDataSource _datasource;
  final RegisterNumberRepository _registerNumberRepository;

  BusinessOffenderRepositoryImpl(this._datasource, this._registerNumberRepository);



///add offender function to store the infomation of the offender to the database
  @override
  Future<BusinessOffender> addOffender(BusinessOffender offender) async {
    final appLogger = await AppLogger.getInstance();
    try {
      final offenderModel = BusinessOffenderModel(
        business_id: offender.business_id,
        business_name: offender.business_name,
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

      final addedOffender = await _datasource.addOffender(offenderModel);

      await appLogger.log("INFO", "Added business offender successfully.");

      return BusinessOffender(
        business_id: addedOffender.business_id,
        business_name: addedOffender.business_name,
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
      await appLogger.log("ERROR", "Failed to add business offender.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to add business offender", code: "ADD_BUSINESS_OFFENDER_ERROR");
    }
  }



/// function to delte the inofmration of the offender frm the database 
  @override
  Future<void> deleteBusinessOffender(int businessId) async {
    final appLogger = await AppLogger.getInstance();
    try {
      await _datasource.deleteOffender(businessId);
      await _registerNumberRepository.deleteRegisterNumber(businessId);

      await appLogger.log("INFO", "Deleted business offender successfully.");
    } catch (e) {
      await appLogger.log("ERROR", "Failed to delete business offender.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to delete business offender", code: "DELETE_BUSINESS_OFFENDER_ERROR");
    }
  }



///function to fetch all the offenders informations from teh databse 
  @override
  Future<List<BusinessOffender>> fetchAllOffenders() async {
    final appLogger = await AppLogger.getInstance();
    try {
      final offenderModels = await _datasource.fetchAllOffenders();

      await appLogger.log("INFO", "Fetched all business offenders successfully.");

      return offenderModels.map((model) {
        return BusinessOffender(
          business_id: model.business_id,
          business_name: model.business_name,
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
      await appLogger.log("ERROR", "Failed to fetch business offenders.", data: {
        "error": e.toString(),
      });
      throw CustomException("Failed to fetch business offenders", code: "FETCH_BUSINESS_OFFENDERS_ERROR");
    }
  }

//function to fetch offender by id from the databse 
  @override
  Future<BusinessOffenderModel?> fetchOffenderById(int id) {
    throw UnimplementedError();
  }


// function to edit the informations of the offender in the databsae 
  @override
  Future<void> editBusinessOffender(BusinessOffender offender, RegisterNumberEntity registerNumber) {
    throw UnimplementedError();
  }
}
