import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';

import '../../entities/rc/register_number_entity.dart';

abstract class BusinessOffenderRepository {
  
  Future<BusinessOffender> addOffender(BusinessOffender offender);
  Future<void> editBusinessOffender(BusinessOffender offender, RegisterNumberEntity registerNumber);
  Future<void> deleteBusinessOffender(int businessId);
  Future<BusinessOffenderModel?> fetchOffenderById(int id);
  Future<List<BusinessOffender>> fetchAllOffenders();
}
