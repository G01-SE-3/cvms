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
