/*
File Name: <commercial_register.dart>
Purpose: <define the CommercialRegister class, representing a commercial register with attributes related to business registration and its associated dates.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
class CommercialRegister {
  final int business_id;
  final String CommercialRegisterNumber;
  final String CommercialRegisterDate;
  final String EditDate;
  String CancellationDate;
  
  CommercialRegister({
    required this.business_id,
    required this.CommercialRegisterNumber,
    required this.CommercialRegisterDate,
    required this.EditDate,
    required this.CancellationDate,
    
  });
}
