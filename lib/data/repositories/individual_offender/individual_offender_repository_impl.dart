

/*
import '../../domain/entities/individual_offender.dart';
import '../../domain/repositories/individual_offender_repository.dart';
import '../datasources/individual_offender_datasource.dart';
import '../models/individual_offender_model.dart';

class IndividualOffenderRepositoryImpl implements IndividualOffenderRepository {
  final IndividualOffenderDataSource dataSource;

  IndividualOffenderRepositoryImpl(this.dataSource);

  @override
  Future<List<IndividualOffender>> fetchAllOffenders() async {
    final data = await dataSource.fetchAllOffenders();
    return data.map((json) => IndividualOffenderModel.fromJson(json).toEntity()).toList();
  }

  @override
  Future<void> addOffender(IndividualOffender offender) async {
    final model = IndividualOffenderModel(
      name: offender.name,
      surname: offender.surname,
      dateOfBirth: offender.dateOfBirth,
      placeOfBirth: offender.placeOfBirth,
      birthCertificateNumber: offender.birthCertificateNumber,
      motherName: offender.motherName,
      motherSurname: offender.motherSurname,
      fatherName: offender.fatherName,
      address: offender.address,
      businessAddress: offender.businessAddress,
    );
    await dataSource.addOffender(model);
  }
}
*/