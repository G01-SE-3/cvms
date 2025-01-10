/*
File Name: financial_penalty.dart
Purpose: This file defines the FinancialPenalty class, which represents a financial penalty associated with a Process Verbal (PV).
Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
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
