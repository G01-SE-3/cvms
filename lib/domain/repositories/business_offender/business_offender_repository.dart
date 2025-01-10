/*
File Name: <business_offender_repository.dart>
Purpose: <define the abstract repository interface for managing business offenders.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/data/models/business_offender/business_offender_model.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';

import '../../entities/rc/register_number_entity.dart';

abstract class BusinessOffenderRepository {
  ///abstract functions to add and edit and delete offender from the databse and also fetch all the offender and fetch one offender by ID 
  ///
  Future<BusinessOffender> addOffender(BusinessOffender offender);
  Future<void> editBusinessOffender(BusinessOffender offender, RegisterNumberEntity registerNumber);
  Future<void> deleteBusinessOffender(int businessId);
  Future<BusinessOffenderModel?> fetchOffenderById(int id);
  Future<List<BusinessOffender>> fetchAllOffenders();
}
