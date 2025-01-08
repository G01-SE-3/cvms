import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import '../../entities/individual_offender/individual_offender.dart';
import '../../entities/rc/register_number_entity.dart';

abstract class IndividualOffenderRepository {

  Future<IndividualOffender> addIndividualOffender(IndividualOffender offender);
  Future<void> editIndividualOffender(IndividualOffender offender,  RegisterNumberEntity registerNumber);
  Future<void> deleteIndividualOffender(int businessId);
  Future<BusinessOffenderModel?> fetchIndividualOffenderById(int id);
  Future<List<IndividualOffender>> fetchAllIndividualOffenders();
}
