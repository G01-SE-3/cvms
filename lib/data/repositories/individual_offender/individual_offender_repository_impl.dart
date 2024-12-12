import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';
import 'package:cvms/data/datasources/individual_offender/individual_offender_datasource.dart';
import 'package:cvms/data/models/individual_offender/individual_offender_model.dart';
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
    individual_id: 0, // Ensure a placeholder or auto-incremented value
    name: offender.name,
    surname: offender.surname,
    date_of_birth: offender.date_of_birth,
    place_of_birth: offender.place_of_birth,
    birth_certificate_number: offender.birth_certificate_number, // Ensure it's a String
    mother_name: offender.mother_name,
    mother_surname: offender.mother_surname,
    father_name: offender.father_name,
    address: offender.address,
    business_address: offender.business_address,
  );
  await dataSource.addOffender(model);
}

}
