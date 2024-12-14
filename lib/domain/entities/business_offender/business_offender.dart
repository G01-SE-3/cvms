class BusinessOffender {
  final int business_id;
  final String business_name;
  final String name;
  final String surname;
  String date_of_birth;
  String place_of_birth;
  String birth_certificate_number;
  String mother_name;
  String mother_surname;
  String father_name;
  String address;
  String business_address;

  BusinessOffender({
    required this.business_id,
    required this.business_name,
    required this.name,
    required this.surname,
    required this.date_of_birth,
    required this.place_of_birth,
    required this.birth_certificate_number,
    required this.mother_name,
    required this.mother_surname,
    required this.father_name,
    required this.address,
    required this.business_address,
  });
}
