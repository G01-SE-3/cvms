import 'package:cvms/data/models/pv/national_card_reg_model.dart';

class NationalCardRegistration {
  final int nationalCardRegId;
  final DateTime nationalCardIssueDate;

  NationalCardRegistration({
    required this.nationalCardRegId,
    required this.nationalCardIssueDate,
  });
  NationalCardRegistrationModel toModel() {
    return NationalCardRegistrationModel(
      nationalCardRegId: nationalCardRegId,
      nationalCardIssueDate: nationalCardIssueDate,
    );
  }
}
