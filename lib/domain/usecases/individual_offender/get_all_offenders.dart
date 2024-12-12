/*
/*EACH USE CASE SHOULD HAVE A SEPARATE FILE*/
/* CONTAINS ONLY EXECUTE FUNCTION*/
import '../entities/individual_offender.dart';
import '../repositories/individual_offender_repository.dart';

class GetAllOffenders {
  final IndividualOffenderRepository repository;

  GetAllOffenders(this.repository);

  Future<List<IndividualOffender>> execute() async {
    return await repository.fetchAllOffenders();
  }
}

*/