import 'package:cvms/domain/entities/business_offender/business_offender.dart';

class BusinessOffenderModel extends BusinessOffender {
  

  BusinessOffenderModel({
    required super.business_id,
    required super.business_name,
    required super.name,
    required super.surname,
    required super.date_of_birth,
    required super.place_of_birth,
    required super.birth_certificate_number,
    required super.mother_name,
    required super.mother_surname,
    required super.father_name,
    required super.address,
    required super.business_address,

  });

  factory BusinessOffenderModel.fromMap(Map<String, dynamic> map) {
    return BusinessOffenderModel(
      business_id: map['business_id'], 
      business_name: map['business_name'],
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
      'business_id': business_id,
      'business_name': business_name,
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

  BusinessOffender toEntity() {
    return BusinessOffender(
      business_id: business_id,
      business_name: business_name,
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

  factory BusinessOffenderModel.fromJson(Map<String, dynamic> json) {
  return BusinessOffenderModel(
    business_id: json['business_id'] ?? 0,
    business_name: json['business_name'] ?? '',
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