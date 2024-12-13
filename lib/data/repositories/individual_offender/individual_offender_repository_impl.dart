import 'dart:math';
import 'package:cvms/domain/entities/Individual_offender/Individual_offender.dart';
import 'package:cvms/domain/repositories/Individual_offender/Individual_offender_repository.dart';
import 'package:cvms/data/datasources/Individual_offender/Individual_offender_datasource.dart';
import 'package:cvms/data/models/Individual_offender/Individual_offender_model.dart';
class IndividualOffenderrepositoryImpl implements IndividualOffenderrepository {
  final IndividualOffenderDataSource dataSource;

  IndividualOffenderrepositoryImpl(this.dataSource);

  @override
  Future<List<IndividualOffender>> fetchAllOffenders() async {
    final data = await dataSource.fetchAllOffenders();
    return data.map((json) => IndividualOffenderModel.fromJson(json).toEntity()).toList();
  }

  @override
Future<void> addOffender(IndividualOffender offender) async {
  Random random = Random();
  final model = IndividualOffenderModel(
    individual_id : random.nextBool() ? 5000 : 1,
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
