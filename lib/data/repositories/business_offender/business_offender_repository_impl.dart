import 'dart:math';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/data/datasources/business_offender/business_offender_datasource.dart';
import 'package:cvms/data/models/business_offender/business_offender_model.dart';
class BusinessOffenderrepositoryImpl implements BusinessOffenderrepository {
  final BusinessOffenderDataSource dataSource;

  BusinessOffenderrepositoryImpl(this.dataSource);

  @override
  Future<List<BusinessOffender>> fetchAllOffenders() async {
    final data = await dataSource.fetchAllOffenders();
    return data.map((json) => BusinessOffenderModel.fromJson(json).toEntity()).toList();
  }

  @override
Future<void> addOffender(BusinessOffender offender) async {
  Random random = Random();
  final model = BusinessOffenderModel(
    business_id : random.nextBool() ? 5000 : 1,
    business_name: offender.business_name,
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
