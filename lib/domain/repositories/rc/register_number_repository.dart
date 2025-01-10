/*`File Name: <register_number_repository.dart>
Purpose: 
- The purpose of this file is to define an abstract class that outlines methods for handling register number data operations.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

import 'package:cvms/domain/entities/rc/register_number_entity.dart';

abstract class RegisterNumberRepository {
  Future<void> insertRegisterNumber(RegisterNumberEntity registerNumber);
  Future<List<RegisterNumberEntity>> getRegisterNumbers();
  Future<String> getBusinessRegisterNumberById(int id);
  Future<String> getIndividualRegisterNumberById(int id);
  Future<void> updateRegisterNumber(RegisterNumberEntity registerNumber);
  Future<void> deleteRegisterNumber(int id);
  Future<Map<String, dynamic>> getOffenderByRC(String commercialRegisterNumber);
}
