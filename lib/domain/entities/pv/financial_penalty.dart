import 'package:cvms/data/models/pv/financial_penalty_model.dart';

class FinancialPenalty {
  final double penaltyAmount;
  final DateTime penaltyDate;
  final int penaltyId;
  final String? paymentReceiptNumber;
  final DateTime? paymentReceiptDate;

  FinancialPenalty({
    required this.penaltyAmount,
    required this.penaltyDate,
    required this.penaltyId,
    this.paymentReceiptNumber,
    this.paymentReceiptDate,
  });

  FinancialPenaltyModel toModel() {
    return FinancialPenaltyModel(
      penaltyId: penaltyId,
      penaltyAmount: penaltyAmount,
      penaltyDate: penaltyDate,
      paymentReceiptNumber: paymentReceiptNumber,
      paymentReceiptDate: paymentReceiptDate,
    );
  }
}
