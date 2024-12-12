/*
/* FIX THE IMPORT IN CASE OF PROBLEMS*/
import '../../domain/entities/individual_offender.dart';

class IndividualOffenderModel {
  final String name;
  final String surname;
  final DateTime dateOfBirth;
  final String placeOfBirth;
  final String birthCertificateNumber;
  final String motherName;
  final String motherSurname;
  final String fatherName;
  final String address;
  final String businessAddress;

  IndividualOffenderModel({
    required this.name,
    required this.surname,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.birthCertificateNumber,
    required this.motherName,
    required this.motherSurname,
    required this.fatherName,
    required this.address,
    required this.businessAddress,
  });

  factory IndividualOffenderModel.fromJson(Map<String, dynamic> json) {
    return IndividualOffenderModel(
      name: json['name'],
      surname: json['surname'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      placeOfBirth: json['place_of_birth'],
      birthCertificateNumber: json['birth_certificate_number'],
      motherName: json['mother_name'],
      motherSurname: json['mother_surname'],
      fatherName: json['father_name'],
      address: json['address'],
      businessAddress: json['business_address'],
    );
  }

  IndividualOffender toEntity() {
    return IndividualOffender(
      name: name,
      surname: surname,
      dateOfBirth: dateOfBirth,
      placeOfBirth: placeOfBirth,
      birthCertificateNumber: birthCertificateNumber,
      motherName: motherName,
      motherSurname: motherSurname,
      fatherName: fatherName,
      address: address,
      businessAddress: businessAddress,
    );
  }

  Map<String, dynamic> toDatabaseJson() {
    return {
      'name': name,
      'surname': surname,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'placeOfBirth': placeOfBirth,
      'birthCertificateNumber': birthCertificateNumber,
      'motherName': motherName,
      'motherSurname': motherSurname,
      'fatherName': fatherName,
      'address': address,
      'businessAddress': businessAddress,
    };
  }
}
*/