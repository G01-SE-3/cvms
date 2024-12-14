import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/repositories/individual_offender/individual_offender_repository.dart';

class GetAllOffenders {
  final IndividualOffenderRepository repository;

  GetAllOffenders(this.repository);

  Future<List<IndividualOffender>> execute() async {
    return await repository.fetchAllOffenders();
  }
}

/*EACH USE CASE SHOULD HAVE A SEPARATE FILE*/
/* CONTAINS ONLY EXECUTE FUNCTION*/