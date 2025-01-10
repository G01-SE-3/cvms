/*
File Name: <commercial_register_model.dart>
Purpose: <Defines a model for the commercial register, providing methods for mapping, conversion>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/commercial_register/commercial_register.dart';
class CommercialRegisterModel extends CommercialRegister {
  

  CommercialRegisterModel({
    required super.business_id,
    required super.CommercialRegisterNumber,
    required super.CommercialRegisterDate,
    required super.EditDate,
    required super.CancellationDate,

  });


/// Creates a [CommercialRegisterModel] from a map, with fields like 'business_id', 'CommercialRegisterNumber', etc.

  factory CommercialRegisterModel.fromMap(Map<String, dynamic> map) {
    return CommercialRegisterModel(
      business_id: map['business_id'], 
      CommercialRegisterNumber: map['CommercialRegisterNumber'],
      CommercialRegisterDate: map['CommercialRegisterDate'],
      EditDate: map['EditDate'],
      CancellationDate: map['CancellationDate'],
      
    );
  }


/// Converts the [CommercialRegisterModel] to a map for serialization.

  Map<String, dynamic> toMap() {
    return {
      'business_id': business_id,
      'CommercialRegisterNumber': CommercialRegisterNumber,
      'CommercialRegisterDate': CommercialRegisterDate,
      'EditDate': EditDate,
      'CancellationDate':CancellationDate,
      };

  }


/// Converts the [CommercialRegisterModel] to a [CommercialRegister] entity.

  CommercialRegister toEntity() {
    return CommercialRegister(
      business_id: business_id,
      CommercialRegisterNumber: CommercialRegisterNumber,
      CommercialRegisterDate: CommercialRegisterDate,
      EditDate: EditDate,
      CancellationDate: CancellationDate,
     );
  }


/// Creates a [CommercialRegisterModel] from a JSON object, with default values for missing fields.

  factory CommercialRegisterModel.fromJson(Map<String, dynamic> json) {
  return CommercialRegisterModel(
    business_id: json['business_id'] ?? 0,
    CommercialRegisterNumber: json['CommercialRegisterNumber'] ?? '',
    CommercialRegisterDate: json['CommercialRegisterDate'] ?? '',
    EditDate: json['EditDate'] ?? '',
    CancellationDate: json['CancellationDate'] ?? '',
   );
}

}