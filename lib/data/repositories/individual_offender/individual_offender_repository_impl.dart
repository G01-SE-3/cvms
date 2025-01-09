import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';
import 'package:cvms/data/datasources/individual_offender/individual_offender_datasource.dart';
import 'package:cvms/data/models/individual_offender/individual_offender_model.dart';
import 'package:cvms/domain/repositories/rc/register_number_repository.dart';
import 'package:cvms/domain/entities/rc/register_number_entity.dart';

 class IndividualOffenderRepositoryImpl implements IndividualOffenderRepository {
  final IndividualOffenderDataSource _datasource;
  final RegisterNumberRepository _registerNumberRepository;

  IndividualOffenderRepositoryImpl(this._datasource, this._registerNumberRepository, );

  @override
  Future<IndividualOffender> addIndividualOffender(IndividualOffender offender) async {
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
    print("Error occurred while adding offender: $e");
    throw Exception("Failed to add offender: $e");
  }
}

  @override
  Future<void> editIndividualOffender(IndividualOffender offender, RegisterNumberEntity registerNumber) async {
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
    } catch (e) {
      print("Error occurred while editing individual offender: $e");
      throw Exception("Failed to edit individual offender: $e");
    }
  }

  @override
  Future<void> deleteIndividualOffender(int individualId) async {
    try {
      await _datasource.deleteIndividualOffender(individualId);
      await _registerNumberRepository.deleteRegisterNumber(individualId);
    } catch (e) {
      print("Error occurred while deleting individual offender: $e");
      throw Exception("Failed to delete individual offender: $e");
    }
  }

  @override
  Future<List<IndividualOffender>> fetchAllIndividualOffenders() async {
    try {
      final offenderModels = await _datasource.fetchAllIndividualOffenders();
      print("fetch in datasource worked");
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
      print("Error occurred while fetching all offenders: $e");
      throw Exception("Failed to fetch offenders: $e");
    }
  }

  @override
  Future<BusinessOffenderModel?> fetchIndividualOffenderById(int id) {
    // TODO: implement fetchIndividualOffenderById
    throw UnimplementedError();
  }
}
