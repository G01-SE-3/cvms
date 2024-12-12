import 'package:cvms/domain/entities/business_offender/business_offender.dart';
abstract class BusinessOffenderRepository {
  Future<List<BusinessOffender>> fetchAllOffenders();
  Future<void> addOffender(BusinessOffender offender);
}

