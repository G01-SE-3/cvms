import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';

class GetAllOffenders {
  final BusinessOffenderrepository repository;

  GetAllOffenders(this.repository);

  Future<List<BusinessOffender>> execute() async {
    return await repository.fetchAllOffenders();
  }
}
