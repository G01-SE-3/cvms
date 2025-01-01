import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/data/datasources/business_offender/business_offender_datasource.dart';
import 'package:cvms/data/models/business_offender/business_offender_model.dart';

import '../../datasources/database_helper.dart';

class BusinessOffenderRepositoryImpl implements BusinessOffenderrepository {
  final BusinessOffenderDataSource _datasource;

  BusinessOffenderRepositoryImpl(this._datasource);

  @override
  Future<void> addOffender(BusinessOffender offender) async {
    try {
      // Convert entity to model manually here
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
      await _datasource.addOffender(offenderModel);
    } catch (e) {
      print("Error occurred while adding offender: $e");
      throw Exception("Failed to add offender: $e");
    }
  }
  
  @override
  // Fetch offender by ID
  Future<BusinessOffenderModel?> fetchOffenderById(int id) async {
    if (id <= 0) {
      print("Invalid offender ID.");
      return null;
    }

    final connection = await DatabaseHelper().connection; 
    final result = await connection.query(
      'SELECT * FROM business_offender WHERE business_id = @id',
      substitutionValues: {'id': id},
    );

    if (result.isNotEmpty) {
      return BusinessOffenderModel.fromMap(result.first.toColumnMap());
    }
    print("Offender with ID $id not found.");
    return null;
  }


  @override
  Future<void> editBusinessOffender(BusinessOffender offender) async {
    try {
      // Convert entity to model manually here
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
      
      await _datasource.updateOffender(offender.business_id, offenderModel);
        } catch (e) {
      print("Error occurred while editing offender: $e");
      throw Exception("Failed to edit offender: $e");
    }
  }

  @override
  Future<void> deleteBusinessOffender(int businessId) async {
    try {
      await _datasource.deleteOffender(businessId);
    } catch (e) {
      print("Error occurred while deleting offender: $e");
      throw Exception("Failed to delete offender: $e");
    }
  }

  @override
  Future<List<BusinessOffender>> fetchAllOffenders() async {
    try {
      final offenderModels = await _datasource.fetchAllOffenders();
      print("fetch in datasource worked");
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
      print("Error occurred while fetching all offenders: $e");
      throw Exception("Failed to fetch offenders: $e");
    }
  }
}
