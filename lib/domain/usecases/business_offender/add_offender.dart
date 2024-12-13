import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:cvms/domain/repositories/business_offender/business_offender_repository.dart';
import 'package:cvms/domain/usecases/business_offender/add_offender.dart';
class AddOffender {
  final BusinessOffenderrepository repository;

  AddOffender(this.repository);

  Future<void> execute(BusinessOffender offender) async {
    await repository.addOffender(offender);
  }
}
