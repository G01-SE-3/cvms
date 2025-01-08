import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';

class AddOffender {
  final BusinessOffenderRepository repository;

  AddOffender(this.repository);

  Future<BusinessOffender> execute(
    BusinessOffender offender,
  ) async {
    final addedOffender = await repository.addOffender(offender);
    return addedOffender;
  }
}
