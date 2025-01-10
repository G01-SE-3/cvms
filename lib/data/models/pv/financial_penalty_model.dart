/*
File Name: pv_model.dart
Purpose: This file defines the FinancialPenaltyModel class

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
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
