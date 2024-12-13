import 'package:cvms/domain/entities/pv/national_card_reg.dart';

class NationalCardRegistrationModel {
  final int nationalCardRegId;
  final DateTime nationalCardIssueDate;

  NationalCardRegistrationModel({
    required this.nationalCardRegId,
    required this.nationalCardIssueDate,
  });

  NationalCardRegistration toEntity() {
    return NationalCardRegistration(
      nationalCardRegId: nationalCardRegId,
      nationalCardIssueDate: nationalCardIssueDate,
    );
  }
}
