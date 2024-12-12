import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';

class IndividualOffenderModel extends IndividualOffender {
  

  IndividualOffenderModel({
    required int individual_id,
    required String name,
    required String surname,
    required String date_of_birth,
    required String place_of_birth,
    required String birth_certificate_number,
    required String mother_name,
    required String mother_surname,
    required String father_name,
    required String address,
    required String business_address,

  }) : super(
          individual_id: individual_id,
          name: name,
          surname: surname,
          date_of_birth: date_of_birth,
          place_of_birth: place_of_birth,
          birth_certificate_number: birth_certificate_number,
          mother_name: mother_name,
          mother_surname: mother_surname,
          father_name: father_name,
          address: address,
          business_address: business_address,
        );

  factory IndividualOffenderModel.fromMap(Map<String, dynamic> map) {
    return IndividualOffenderModel(
      individual_id: map['individual_id'], 
      name: map['name'],
      surname: map['surname'],
      date_of_birth: map['date_of_birth'],
      place_of_birth: map['place_of_birth'],
      birth_certificate_number: map['birth_certificate_number'],
      mother_name: map['mother_name'],
      mother_surname: map['mother_surname'],
      father_name: map['father_name'],
      address: map['address'],
      business_address: map['business_address'],
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'individual_id': individual_id,
      'name': name,
      'surname': surname,
      'date_of_birth':date_of_birth,
      'place_of_birth':place_of_birth,
      'birth_certificate_number':birth_certificate_number,
      'mother_name':mother_name,
      'mother_surname':mother_surname,
      'father_name':father_name,
      'address':address,
      'business_address':business_address,
    };

  }

  IndividualOffender toEntity() {
    return IndividualOffender(
      individual_id: individual_id,
      name: name,
      surname: surname,
      date_of_birth: date_of_birth,
      place_of_birth: place_of_birth,
      birth_certificate_number: birth_certificate_number,
      mother_name: mother_name,
      mother_surname: mother_surname,
      father_name: father_name,
      address: address,
      business_address: business_address,
    );
  }

  factory IndividualOffenderModel.fromJson(Map<String, dynamic> json) {
  return IndividualOffenderModel(
    individual_id: json['individual_id'] ?? 0,
    name: json['name'] ?? '',
    surname: json['surname'] ?? '',
    date_of_birth: json['date_of_birth'] ?? '',
    place_of_birth: json['place_of_birth'] ?? '',
    birth_certificate_number: json['birth_certificate_number']?.toString() ?? '',
    mother_name: json['mother_name'] ?? '',
    mother_surname: json['mother_surname'] ?? '',
    father_name: json['father_name'] ?? '',
    address: json['address'] ?? '',
    business_address: json['business_address'] ?? '',
  );
}

}