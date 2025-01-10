/*`File Name: <register_number_entity.dart>
Purpose: 
- The purpose of this file is to represent a register number entity and facilitate interactions with the corresponding data in the application.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

class RegisterNumberEntity {
  final int? individualOffenderId;  // Foreign key to IndividualOffender table nullable
  final int? businessOffenderId;   // Foreign key to BusinessOffender table nullable
  final String registerNumber;    
  final String commercialRegisterDate;
  final String editDate;
  final String cancellationDate;

  RegisterNumberEntity({
    required this.individualOffenderId,
    required this.businessOffenderId,
    required this.registerNumber, 
    required this.commercialRegisterDate,
    required this.editDate,
    required this.cancellationDate,
  });
}
