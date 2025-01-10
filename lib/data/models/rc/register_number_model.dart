/*`File Name: <register_number_model.dart>
Purpose: 
- The purpose of this file is to define the RegisterNumber class, which handles data related to commercial register numbers and associated dates.
Authors:
- BOUHOUIA Yousra [yousra.bouhouia@ensia.edu.dz]

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved`*/

class RegisterNumber {
  final String registerNumber;  
  final int? individualOffenderId;  
  final int? businessOffenderId; 
  final String commercialRegisterDate;
  final String editDate;
  final String cancellationDate;

  RegisterNumber({
    required this.registerNumber,
    this.individualOffenderId,
    this.businessOffenderId,
    required this.commercialRegisterDate,
    required this.editDate,
    required this.cancellationDate,
  });

factory RegisterNumber.fromJson(Map<String, dynamic> json) {

  String registerNumber = json['commercialregisternumber'] ?? 'Unknown';
  int? individualOffenderId = json['individualOffenderId'] != null
      ? int.tryParse(json['individualOffenderId'].toString()) 
      : null;
  
  int? businessOffenderId = json['businessOffenderId'] != null
      ? int.tryParse(json['businessOffenderId'].toString()) 
      : null;

  String commercialRegisterDate = json['commercialregisterdate'] ?? 'Unknown';
  String editDate = json['editdate'] ?? 'Unknown';
  String cancellationDate = json['cancellationdate'] ?? 'Unknown';
  return RegisterNumber(
    registerNumber: registerNumber,
    individualOffenderId: individualOffenderId,
    businessOffenderId: businessOffenderId,
    commercialRegisterDate: commercialRegisterDate,
    editDate: editDate,
    cancellationDate: cancellationDate,
  );
}


  Map<String, dynamic> toJson() {
    return {
      'commercialregisternumberId': registerNumber,
      'individualOffenderId': individualOffenderId,
      'businessOffenderId': businessOffenderId,
      'commercialregisterdate': commercialRegisterDate,
      'editdate': editDate,
      'cancellationdate': cancellationDate,
    };
  }
}
