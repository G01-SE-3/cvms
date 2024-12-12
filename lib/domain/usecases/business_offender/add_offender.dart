import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';

class AddOffender {
  final BusinessOffenderRepository repository;

  AddOffender(this.repository);

  Future<void> execute(BusinessOffender offender) async {
    await repository.addOffender(offender);
  }
}
