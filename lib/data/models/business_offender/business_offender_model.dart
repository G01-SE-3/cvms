/*
File Name: <business_offender_model.dart>
Purpose: <Represents the data model for business offenders, providing methods for data mapping and conversion.>
Authors: 
- BENHAMOUCHE Lydia [lydia.benhamouche@ensia.edu.dz](mailto:lydia.benhamouche@ensia.edu.dz)

`Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
import 'package:cvms/domain/entities/business_offender/business_offender.dart';
import 'package:intl/intl.dart';

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
/// Creates a [BusinessOffenderModel] from a map, formatting the 'date_of_birth' if needed.

  factory BusinessOffenderModel.fromMap(Map<String, dynamic> map) {
    String formattedDate = '';
    if (map['date_of_birth'] is DateTime) {
      formattedDate = DateFormat('yyyy-MM-dd').format(map['date_of_birth']);
    } else if (map['date_of_birth'] is String) {
      formattedDate = map['date_of_birth'];
    }

    return BusinessOffenderModel(
      business_id: map['business_id'],
      business_name: map['business_name'],
      name: map['name'],
      surname: map['surname'],
      date_of_birth: formattedDate, 
      place_of_birth: map['place_of_birth'],
      birth_certificate_number: map['birth_certificate_number'],
      mother_name: map['mother_name'],
      mother_surname: map['mother_surname'],
      father_name: map['father_name'],
      address: map['address'],
      business_address: map['business_address'], // Add business_address from map
    );
  }


/// Converts the [BusinessOffenderModel] to a map for serialization.
  Map<String, dynamic> toMap() {
    return {
      'business_id': business_id,
      'business_name': business_name,
      'name': name,
      'surname': surname,
      'date_of_birth': date_of_birth,
      'place_of_birth': place_of_birth,
      'birth_certificate_number': birth_certificate_number,
      'mother_name': mother_name,
      'mother_surname': mother_surname,
      'father_name': father_name,
      'address': address,
      'business_address': business_address, // Include business_address
    };
  }

/// Converts the [BusinessOffenderModel] to a [BusinessOffender] entity.
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
/// Creates a [BusinessOffenderModel] from a [BusinessOffender] entity.
  factory BusinessOffenderModel.fromEntity(BusinessOffender offender) {
    return BusinessOffenderModel(
      business_id: offender.business_id,
      business_name: offender.business_name,
      name: offender.name,
      surname: offender.surname,
      date_of_birth: offender.date_of_birth,
      place_of_birth: offender.place_of_birth,
      birth_certificate_number: offender.birth_certificate_number,
      mother_name: offender.mother_name,
      mother_surname: offender.mother_surname,
      father_name: offender.father_name,
      address: offender.address,
      business_address: offender.business_address, 
    );
  }

  
/// Creates a [BusinessOffenderModel] from a JSON object, with default values for missing fields.
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
