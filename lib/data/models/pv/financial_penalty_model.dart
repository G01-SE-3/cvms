import 'package:cvms/domain/entities/pv/financial_penalty.dart';

class FinancialPenaltyModel {
  final int penaltyId;
  final String pvId;
  final double penaltyAmount;
  final DateTime penaltyDate;
  final String? paymentReceiptNumber;
  final DateTime? paymentReceiptDate;

  FinancialPenaltyModel({
    required this.penaltyId,
    required this.penaltyAmount,
    required this.penaltyDate,
    this.paymentReceiptNumber,
    this.paymentReceiptDate,
    this.pvId = '',
  });

  FinancialPenalty toEntity() {
    return FinancialPenalty(
      penaltyId: penaltyId,
      penaltyAmount: penaltyAmount,
      penaltyDate: penaltyDate,
      paymentReceiptNumber: paymentReceiptNumber,
      paymentReceiptDate: paymentReceiptDate,
    );
  }
}
