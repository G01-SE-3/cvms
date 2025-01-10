/*
File Name: pv_model.dart
Purpose: This file defines the LegalProceedingsModel class

Authors:
- Team Member 1 safia.tifour@ensia.edu.dz

Copyright 2025 G01-SE-3 Team.
Created as part of the Software Engineering course at ENSIA.
All rights reserved
*/
class LegalProceedingsModel {
  final String? referralToJusticeNumber; // Referral number for justice
  final DateTime? referralToJusticeDate; // Date of referral
  final String? jurisdiction; // Jurisdiction where the case is handled
  final String? legalProvisions; // Legal provisions involved in the case
  final String? courtDecisionNumber; // Court decision number
  final DateTime? courtDecisionDate; // Court decision date
  final double? courtImposedFineAmount; // Fine imposed by the court

  // Constructor
  LegalProceedingsModel({
    this.referralToJusticeNumber,
    this.referralToJusticeDate,
    this.jurisdiction,
    this.legalProvisions,
    this.courtDecisionNumber,
    this.courtDecisionDate,
    this.courtImposedFineAmount,
  });
}
