import 'package:cvms/domain/entities/commercial_register/commercial_register.dart';
class CommercialRegisterModel extends CommercialRegister {
  

  CommercialRegisterModel({
    required int business_id,
    required String CommercialRegisterNumber,
    required String CommercialRegisterDate,
    required String EditDate,
    required String CancellationDate,

  }) : super(
          business_id: business_id,
          CommercialRegisterNumber: CommercialRegisterNumber,
          CommercialRegisterDate: CommercialRegisterDate,
          EditDate: EditDate,
          CancellationDate: CancellationDate,

        );

  /*factory CommercialRegister.fromMap(Map<String, dynamic> map) {
    return CommercialRegisterModel(
      business_id: map['business_id'], 
      CommercialRegisterNumber: map['CommercialRegisterNumber'],
      CommercialRegisterDate: map['CommercialRegisterDate'],
      EditDate: map['EditDate'],
      CancellationDate: map['CancellationDate'],
      
    );
  }*/

  Map<String, dynamic> toMap() {
    return {
      'business_id': business_id,
      'CommercialRegisterNumber': CommercialRegisterNumber,
      'CommercialRegisterDate': CommercialRegisterDate,
      'EditDate': EditDate,
      'CancellationDate':CancellationDate,
      };

  }

  CommercialRegister toEntity() {
    return CommercialRegister(
      business_id: business_id,
      CommercialRegisterNumber: CommercialRegisterNumber,
      CommercialRegisterDate: CommercialRegisterDate,
      EditDate: EditDate,
      CancellationDate: CancellationDate,
     );
  }

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