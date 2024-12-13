import 'package:cvms/data/models/pv/pv_model.dart';
import 'package:cvms/data/models/pv/inspector_model.dart';
import 'package:cvms/data/models/pv/offender.dart';
import 'package:cvms/core/utils/get_db.dart';
import 'package:cvms/data/models/pv/financial_penalty_model.dart';
import 'package:cvms/data/models/pv/closure_model.dart';
import 'package:cvms/data/models/pv/national_card_reg_model.dart';
import 'package:cvms/data/models/pv/seizure_model.dart';

class PVDataSource {
  Future<PVModel?> getPVDetails(String pvId) async {
    final connection = await getDatabaseConnection(); // Get DB connection
    try {
      // Query to fetch PV details
      var result = await connection.connection!.query('''
        SELECT 
          pv_id, 
          pv_number, 
          issue_date, 
          violation_type, 
          total_reparation_amount, 
          total_non_fixed, 
          subsidized_good, 
          individual_id, 
          business_id
        FROM pv
        WHERE pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

      if (result.isEmpty) {
        return null; // No PV data found
      }

      // Extract PV data from result
      var pvData = result.first;
      int pvNumber = pvData[1];
      DateTime issueDate = pvData[2];
      String violationType = pvData[3];
      double? totalReparationAmount = _tryParseDouble(pvData[4]);
      double? totalNonFixed = _tryParseDouble(pvData[5]);
      String? subsidizedGood = pvData[6];

      // Fetch Financial Penalty (Ensure only one penalty is returned)
      var financialPenaltyResult = await connection.connection!.query('''
        SELECT penalty_id, penalty_amount, penalty_date, payment_receipt_number, payment_receipt_date
        FROM financial_penalty WHERE pv_id = @pvId LIMIT 1
      ''', substitutionValues: {'pvId': pvId});

      FinancialPenaltyModel? financialPenalty;
      if (financialPenaltyResult.isNotEmpty) {
        var penaltyData = financialPenaltyResult.first;
        financialPenalty = FinancialPenaltyModel(
          penaltyId: penaltyData[0],
          pvId: pvId,
          penaltyAmount: _tryParseDouble(penaltyData[1]) ?? 0.0,
          penaltyDate: penaltyData[2],
          paymentReceiptNumber: penaltyData[3],
          paymentReceiptDate: penaltyData[4],
        );
      }

      // Fetch Seizures
      var seizuresResult = await connection.connection!.query('''
        SELECT s.seizure_id, s.seizure_amount, s.seizure_quantity, s.seized_goods
        FROM seizure s
        JOIN pv_seizure ps ON ps.seizure_id = s.seizure_id
        WHERE ps.pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

      List<SeizureModel> seizures = [];
      for (var seizureData in seizuresResult) {
        seizures.add(SeizureModel(
          seizureId: seizureData[0],
          seizureAmount: seizureData[1],
          seizureQuantity: seizureData[2],
          seizedGoods: seizureData[3],
        ));
      }

      // Fetch Closure
      var closureResult = await connection.connection!.query('''
        SELECT closure_id, closure_order_date, reopening_request_number
        FROM closure WHERE pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

      ClosureModel? closure;
      if (closureResult.isNotEmpty) {
        var closureData = closureResult.first;
        closure = ClosureModel(
          closureId: closureData[0],
          closureOrderDate: closureData[1],
          reopeningRequestNumber: closureData[2],
        );
      }

      // Fetch National Card Registration
      var nationalCardResult = await connection.connection!.query('''
        SELECT national_card_reg_id, national_card_issue_date
        FROM national_card_reg WHERE pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

      NationalCardRegistrationModel? nationalCardRegistration;
      if (nationalCardResult.isNotEmpty) {
        var nationalCardData = nationalCardResult.first;
        nationalCardRegistration = NationalCardRegistrationModel(
          nationalCardRegId: nationalCardData[0],
          nationalCardIssueDate: nationalCardData[1],
        );
      }

      return PVModel(
        pvId: pvId,
        pvNumber: pvNumber,
        issueDate: issueDate,
        violationType: violationType,
        totalReparationAmount: totalReparationAmount,
        totalNonFixed: totalNonFixed,
        subsidizedGood: subsidizedGood,
        offender: OffenderModel(name: "John Doe"), // Placeholder for Offender
        inspectors: [
          InspectorModel(
              inspectorId: 1,
              inspectorName: "John",
              inspectorSurname: "Smith",
              inspectorDepartment: "Dept A",
              contactNumber: "123-456-7890"),
        ],
        seizures: seizures,
        closure: closure,
        nationalCardRegistration: nationalCardRegistration,
        financialPenalty:
            financialPenalty, // Single financial penalty, not a list
      );
    } catch (e) {
      print("Error fetching PV details: $e");
      rethrow; // Propagate the error to the caller
    }
  }

  // Helper method to safely parse a value to a double
  double? _tryParseDouble(dynamic value) {
    if (value == null) return null;
    return double.tryParse(value.toString());
  }

  Future<List<PVModel>> getAllPVs() async {
    final connection = await getDatabaseConnection(); // Get DB connection
    try {
      // Query to fetch all PVs
      var result = await connection.connection!.query('''
      SELECT 
        pv_id, 
        pv_number, 
        issue_date, 
        violation_type, 
        total_reparation_amount, 
        total_non_fixed, 
        subsidized_good, 
        individual_id, 
        business_id
      FROM pv;
    ''');

      // Debugging: print the raw result to inspect the data types
      print('Query Result: $result');

      // Check if no PVs exist
      if (result.isEmpty) {
        return []; // Return an empty list if no PVs found
      }

      // Parse the results into a list of PVModel
      List<PVModel> pvList = [];
      for (var row in result) {
        // Print the row to inspect the individual field values and types
        print('Row: $row');

        pvList.add(PVModel(
          pvId: row[0]
              as String, // Ensure pvId is treated as a String (VARCHAR in DB)
          pvNumber:
              row[1] as int, // Ensure pvNumber is treated as an int (INT in DB)
          issueDate: row[2] as DateTime, // Ensure issue_date is DateTime
          violationType: row[3] as String, // Ensure violation_type is String
          totalReparationAmount:
              _tryParseDouble(row[4]), // Safely parse as double
          totalNonFixed: _tryParseDouble(row[5]), // Safely parse as double
          subsidizedGood: row[6] as String, // Handle nullable bool
          offender: OffenderModel(name: "Placeholder"), // Placeholder for now
          inspectors: [
            InspectorModel(
                // TO BE UPDATED
                inspectorId: 1,
                inspectorName: "mohamed",
                inspectorSurname: "ahmed",
                inspectorDepartment: "dep",
                contactNumber: "124566"),
          ], // Empty list as inspectors are not fetched in this query
          seizures: [], // Empty list as seizures are not fetched in this query
          closure: null, // Closure is not fetched in this query
          nationalCardRegistration:
              null, // National card is not fetched in this query
          financialPenalty:
              null, // Financial penalty is not fetched in this query
        ));
      }

      return pvList;
    } catch (e) {
      print("Error fetching all PVs: $e");
      rethrow; // Propagate the error to the caller
    }
  }

  Future<void> insertPV(PVModel pvModel) async {
    final connection = await getDatabaseConnection(); // Get DB connection
    try {
      // Start a transaction to ensure atomicity
      await connection.connection!.transaction((txn) async {
        // Insert into `pv` table
        var result = await txn.query('''
          INSERT INTO pv (
            pv_id, pv_number, issue_date, violation_type, total_reparation_amount, 
            total_non_fixed, subsidized_good, individual_id, business_id
          ) VALUES (
            @pvId, @pvNumber, @issueDate, @violationType, @totalReparationAmount,
            @totalNonFixed, @subsidizedGood, @individualId, @businessId
          )
        ''', substitutionValues: {
          'pvId': pvModel.pvId,
          'pvNumber': pvModel.pvNumber,
          'issueDate': pvModel.issueDate,
          'violationType': pvModel.violationType,
          'totalReparationAmount': pvModel.totalReparationAmount,
          'totalNonFixed': pvModel.totalNonFixed,
          'subsidizedGood': pvModel.subsidizedGood,
          'individualId': pvModel.offender?.name ?? null, // TO BE UPDATED
          'businessId': pvModel.offender?.name ?? 1, // TO BE UPDATED
        });

        // Insert into `pv_inspector` table for each inspector
        for (var inspector in pvModel.inspectors) {
          await txn.query('''
            INSERT INTO pv_inspector (pv_id, inspector_id) VALUES (@pvId, @inspectorId)
          ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'inspectorId': inspector.inspectorId,
          });
        }

        // Insert into `financial_penalty` table if available
        if (pvModel.financialPenalty != null) {
          await txn.query('''
            INSERT INTO financial_penalty (
              pv_id, penalty_amount, penalty_date, payment_receipt_number, payment_receipt_date
            ) VALUES (
              @pvId, @penaltyAmount, @penaltyDate, @paymentReceiptNumber, @paymentReceiptDate
            )
          ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'penaltyAmount': pvModel.financialPenalty!.penaltyAmount,
            'penaltyDate': pvModel.financialPenalty!.penaltyDate,
            'paymentReceiptNumber':
                pvModel.financialPenalty!.paymentReceiptNumber,
            'paymentReceiptDate': pvModel.financialPenalty!.paymentReceiptDate,
          });
        }

        // Insert into `seizure` table for each seizure
        for (var seizure in pvModel.seizures) {
          var seizureResult = await txn.query('''
            INSERT INTO seizure (seizure_amount, seizure_quantity, seized_goods) 
            VALUES (@seizureAmount, @seizureQuantity, @seizedGoods) RETURNING seizure_id
          ''', substitutionValues: {
            'seizureAmount': seizure.seizureAmount,
            'seizureQuantity': seizure.seizureQuantity,
            'seizedGoods': seizure.seizedGoods,
          });
          int seizureId = seizureResult.first[0];

          // Link seizure with PV
          await txn.query('''
            INSERT INTO pv_seizure (pv_id, seizure_id) VALUES (@pvId, @seizureId)
          ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'seizureId': seizureId,
          });
        }

        // Insert into `closure` table if available
        if (pvModel.closure != null) {
          await txn.query('''
            INSERT INTO closure (pv_id, closure_order_date, reopening_request_number, reporting_date)
            VALUES (@pvId, @closureOrderDate, @reopeningRequestNumber, @reportingDate)
          ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'closureOrderDate': pvModel.closure!.closureOrderDate,
            'reopeningRequestNumber': pvModel.closure!.reopeningRequestNumber,
            'reportingDate': pvModel.closure!.reportingDate,
          });
        }

        // Insert into `national_card_reg` table if available
// Insert into `national_card_reg` table if available
        if (pvModel.nationalCardRegistration != null) {
          await txn.query('''
    INSERT INTO national_card_reg (national_card_reg_id, pv_id, national_card_issue_date)
    VALUES (@nationalCardRegId, @pvId, @nationalCardIssueDate)
  ''', substitutionValues: {
            'nationalCardRegId':
                pvModel.nationalCardRegistration!.nationalCardRegId,
            'pvId': pvModel.pvId,
            'nationalCardIssueDate':
                pvModel.nationalCardRegistration!.nationalCardIssueDate,
          });
        }
      });
    } catch (e) {
      print("Error inserting PV data: $e");
      rethrow; // Propagate the error to the caller
    }
  }
}
