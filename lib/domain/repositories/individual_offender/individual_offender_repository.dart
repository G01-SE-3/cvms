/*
File Name: <individual_offender_repository.dart>
Purpose: <define the abstract repository interface for managing individual offenders.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz](mailto:yousra.bouhouia@ensia.edu.dz)


`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import '../../entities/individual_offender/individual_offender.dart';
import '../../entities/rc/register_number_entity.dart';

abstract class IndividualOffenderRepository {

///abstract functions to add and edit and delete offender from the databse and also fetch all the offender and fetch one offender by ID 
  ///
  Future<IndividualOffender> addIndividualOffender(IndividualOffender offender);
  Future<void> editIndividualOffender(IndividualOffender offender,  RegisterNumberEntity registerNumber);
  Future<void> deleteIndividualOffender(int businessId);
  Future<BusinessOffenderModel?> fetchIndividualOffenderById(int id);
  Future<List<IndividualOffender>> fetchAllIndividualOffenders();
}
