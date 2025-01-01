import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';

abstract class BusinessOffenderrepository {
  //Future<List<BusinessOffender>> fetchAllOffenders();
  Future<void> addOffender(BusinessOffender offender);
  Future<void> editBusinessOffender(BusinessOffender offender);
  Future<void> deleteBusinessOffender(int businessId);
  Future<BusinessOffenderModel?> fetchOffenderById(int id);
  Future<List<BusinessOffender>> fetchAllOffenders();
}
