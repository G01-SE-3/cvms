import 'package:cvms/data/models/pv/pv_model.dart';
import 'package:cvms/data/models/pv/offender.dart';
import 'package:cvms/core/utils/get_db.dart';
import 'package:cvms/data/models/pv/financial_penalty_model.dart';
import 'package:cvms/data/models/pv/closure_model.dart';
import 'package:cvms/data/models/pv/national_card_reg_model.dart';
import 'package:cvms/data/models/pv/seizure_model.dart';
import 'package:cvms/data/models/inspector/inspector_model.dart';

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

      // Extract PV data
      var pvData = result.first;
      int pvNumber = pvData[1];
      DateTime issueDate = pvData[2];
      String violationType = pvData[3];
      double? totalReparationAmount = _tryParseDouble(pvData[4]);
      double? totalNonFixed = _tryParseDouble(pvData[5]);
      String? subsidizedGood = pvData[6];

      // Fetch Financial Penalty
      var financialPenaltyResult = await connection.connection!.query('''
      SELECT penalty_id, penalty_amount, penalty_date, payment_receipt_number, payment_receipt_date
      FROM financial_penalty WHERE pv_id = @pvId LIMIT 1;
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

      // Fetch Inspectors
      var inspectorResult = await connection.connection!.query('''
      SELECT i.inspector_id, i.name, i.surname, i.badge_number, i.assigned_department, i.contact_number
      FROM inspector i
      JOIN pv_inspector pi ON pi.inspector_id = i.inspector_id
      WHERE pi.pv_id = @pvId;
    ''', substitutionValues: {'pvId': pvId});

      List<InspectorModel> inspectors = [];
      for (var inspectorData in inspectorResult) {
        inspectors.add(InspectorModel(
          id: inspectorData[0],
          name: inspectorData[1],
          surname: inspectorData[2],
          badgeNumber: inspectorData[3],
          assignedDepartment: inspectorData[4],
          contactNumber: inspectorData[5],
        ));
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
        offender: OffenderModel(name: "John Doe"),
        inspectors: inspectors,
        seizures: seizures,
        closure: closure,
        nationalCardRegistration: nationalCardRegistration,
        financialPenalty: financialPenalty,
      );
    } catch (e) {
      print("Error fetching PV details: $e");
      rethrow;
    }
  }

  // Helper method to safely parse a value to a double
  double? _tryParseDouble(dynamic value) {
    if (value == null) return null;
    return double.tryParse(value.toString());
  }

  Future<List<PVModel>> getAllPVs() async {
    final connection = await getDatabaseConnection(); // Get DB connection
    List<PVModel> pvList = [];

    try {
      // Query to fetch all PV details
      var result = await connection.connection!.query('''
      SELECT 
        pv_id, 
        pv_number, 
        issue_date, 
        violation_type, 
        total_reparation_amount, 
        total_non_fixed, 
        subsidized_good
      FROM pv;
    ''');

      for (var pvData in result) {
        String pvId = pvData[0];
        int pvNumber = pvData[1];
        DateTime issueDate = pvData[2];
        String violationType = pvData[3];
        double? totalReparationAmount = _tryParseDouble(pvData[4]);
        double? totalNonFixed = _tryParseDouble(pvData[5]);
        String? subsidizedGood = pvData[6];

        // Fetch Inspectors for each PV
        var inspectorResult = await connection.connection!.query('''
        SELECT 
          i.inspector_id, 
          i.name, 
          i.surname, 
          i.badge_number, 
          i.assigned_department, 
          i.contact_number
        FROM inspector i
        JOIN pv_inspector pi ON pi.inspector_id = i.inspector_id
        WHERE pi.pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

        List<InspectorModel> inspectors = [];
        for (var inspectorData in inspectorResult) {
          inspectors.add(InspectorModel(
            id: inspectorData[0],
            name: inspectorData[1],
            surname: inspectorData[2],
            badgeNumber: inspectorData[3],
            assignedDepartment: inspectorData[4],
            contactNumber: inspectorData[5],
          ));
        }

        // Create PVModel and add to list
        pvList.add(PVModel(
          pvId: pvId,
          pvNumber: pvNumber,
          issueDate: issueDate,
          violationType: violationType,
          totalReparationAmount: totalReparationAmount,
          totalNonFixed: totalNonFixed,
          subsidizedGood: subsidizedGood,
          offender:
              OffenderModel(name: "John Doe"), // You can adjust this as needed
          inspectors: inspectors,
          seizures: [], // Empty list for seizures as per your requirements
          closure: null, // No closure data included
          nationalCardRegistration:
              null, // No national card registration included
          financialPenalty: null, // No financial penalty included
        ));
      }

      return pvList;
    } catch (e) {
      print("Error fetching all PVs: $e");
      rethrow;
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
          'individualId': pvModel.offender?.name, // TO BE UPDATED
          'businessId': pvModel.offender?.name ?? 1, // TO BE UPDATED
        });

        for (var inspector in pvModel.inspectors) {
          try {
            await txn.query('''
      INSERT INTO pv_inspector (pv_id, inspector_id) VALUES (@pvId, @inspectorId)
    ''', substitutionValues: {
              'pvId': pvModel.pvId,
              'inspectorId': inspector.id,
            });
            print(
                "Inserted inspector with ID: ${inspector.id} for PV ID: ${pvModel.pvId}");
          } catch (e) {
            print(
                "Error inserting inspector: ${inspector.id} for PV ID: ${pvModel.pvId}: $e");
          }
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

  ///Searching PVS with a specific number
  Future<List<PVModel>> searchPV(int pvnumber) async {
    final connection = await getDatabaseConnection(); // Get DB connection
    List<PVModel> pvList = [];

    try {
      // Query to fetch only PVs with the given pvNumber
      var result = await connection.connection!.query('''
    SELECT 
      pv_id, 
      pv_number, 
      issue_date, 
      violation_type, 
      total_reparation_amount, 
      total_non_fixed, 
      subsidized_good
    FROM pv
    WHERE pv_number = @pvnumber; 
    ''', substitutionValues: {'pvnumber': pvnumber});

      for (var pvData in result) {
        String pvId = pvData[0];
        int pvNumber = pvData[1];
        DateTime issueDate = pvData[2];
        String violationType = pvData[3];
        double? totalReparationAmount = _tryParseDouble(pvData[4]);
        double? totalNonFixed = _tryParseDouble(pvData[5]);
        String? subsidizedGood = pvData[6];

        // Fetch Inspectors for each PV
        var inspectorResult = await connection.connection!.query('''
      SELECT 
        i.inspector_id, 
        i.name, 
        i.surname, 
        i.badge_number, 
        i.assigned_department, 
        i.contact_number
      FROM inspector i
      JOIN pv_inspector pi ON pi.inspector_id = i.inspector_id
      WHERE pi.pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

        List<InspectorModel> inspectors = [];
        for (var inspectorData in inspectorResult) {
          inspectors.add(InspectorModel(
            id: inspectorData[0],
            name: inspectorData[1],
            surname: inspectorData[2],
            badgeNumber: inspectorData[3],
            assignedDepartment: inspectorData[4],
            contactNumber: inspectorData[5],
          ));
        }

        // Add the matching PV to the list
        pvList.add(PVModel(
          pvId: pvId,
          pvNumber: pvNumber,
          issueDate: issueDate,
          violationType: violationType,
          totalReparationAmount: totalReparationAmount,
          totalNonFixed: totalNonFixed,
          subsidizedGood: subsidizedGood,
          offender: OffenderModel(name: "John Doe"),
          inspectors: inspectors,
          seizures: [],
          closure: null,
          nationalCardRegistration: null,
          financialPenalty: null,
        ));
      }

      return pvList;
    } catch (e) {
      print("Error fetching PVs: $e");
      rethrow;
    }
  }

//filtering PVS by latest input
  Future<List<PVModel>> filterByLatest(int number) async {
    final connection = await getDatabaseConnection(); // Get DB connection
    List<PVModel> pvList = [];

    try {
      // Query to fetch the latest PV details based on issue_date
      var result = await connection.connection!.query('''
    SELECT 
      pv_id, 
      pv_number, 
      issue_date, 
      violation_type, 
      total_reparation_amount, 
      total_non_fixed, 
      subsidized_good
    FROM pv
    ORDER BY issue_date DESC
    LIMIT @limit;
    ''', substitutionValues: {'limit': number});

      for (var pvData in result) {
        String pvId = pvData[0];
        int pvNumber = pvData[1];
        DateTime issueDate = pvData[2];
        String violationType = pvData[3];
        double? totalReparationAmount = _tryParseDouble(pvData[4]);
        double? totalNonFixed = _tryParseDouble(pvData[5]);
        String? subsidizedGood = pvData[6];

        // Fetch Inspectors for each PV
        var inspectorResult = await connection.connection!.query('''
      SELECT 
        i.inspector_id, 
        i.name, 
        i.surname, 
        i.badge_number, 
        i.assigned_department, 
        i.contact_number
      FROM inspector i
      JOIN pv_inspector pi ON pi.inspector_id = i.inspector_id
      WHERE pi.pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

        List<InspectorModel> inspectors = [];
        for (var inspectorData in inspectorResult) {
          inspectors.add(InspectorModel(
            id: inspectorData[0],
            name: inspectorData[1],
            surname: inspectorData[2],
            badgeNumber: inspectorData[3],
            assignedDepartment: inspectorData[4],
            contactNumber: inspectorData[5],
          ));
        }

        // Create PVModel and add to list
        pvList.add(PVModel(
          pvId: pvId,
          pvNumber: pvNumber,
          issueDate: issueDate,
          violationType: violationType,
          totalReparationAmount: totalReparationAmount,
          totalNonFixed: totalNonFixed,
          subsidizedGood: subsidizedGood,
          offender:
              OffenderModel(name: "John Doe"), // You can adjust this as needed
          inspectors: inspectors,
          seizures: [], // Empty list for seizures as per your requirements
          closure: null, // No closure data included
          nationalCardRegistration:
              null, // No national card registration included
          financialPenalty: null, // No financial penalty included
        ));
      }

      return pvList;
    } catch (e) {
      print("Error fetching the latest PVs: $e");
      rethrow;
    }
  }

  Future<List<PVModel>> filterByDate(
      DateTime startDate, DateTime endDate) async {
    final connection = await getDatabaseConnection(); // Get DB connection
    List<PVModel> pvList = [];

    try {
      // Query to fetch PVs within the specified date range
      var result = await connection.connection!.query('''
    SELECT 
      pv_id, 
      pv_number, 
      issue_date, 
      violation_type, 
      total_reparation_amount, 
      total_non_fixed, 
      subsidized_good
    FROM pv
    WHERE issue_date BETWEEN @startDate AND @endDate;
    ''', substitutionValues: {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String()
      });

      for (var pvData in result) {
        String pvId = pvData[0];
        int pvNumber = pvData[1];
        DateTime issueDate = pvData[2];
        String violationType = pvData[3];
        double? totalReparationAmount = _tryParseDouble(pvData[4]);
        double? totalNonFixed = _tryParseDouble(pvData[5]);
        String? subsidizedGood = pvData[6];

        // Fetch Inspectors for each PV
        var inspectorResult = await connection.connection!.query('''
      SELECT 
        i.inspector_id, 
        i.name, 
        i.surname, 
        i.badge_number, 
        i.assigned_department, 
        i.contact_number
      FROM inspector i
      JOIN pv_inspector pi ON pi.inspector_id = i.inspector_id
      WHERE pi.pv_id = @pvId;
      ''', substitutionValues: {'pvId': pvId});

        List<InspectorModel> inspectors = [];
        for (var inspectorData in inspectorResult) {
          inspectors.add(InspectorModel(
            id: inspectorData[0],
            name: inspectorData[1],
            surname: inspectorData[2],
            badgeNumber: inspectorData[3],
            assignedDepartment: inspectorData[4],
            contactNumber: inspectorData[5],
          ));
        }

        // Create PVModel and add to list
        pvList.add(PVModel(
          pvId: pvId,
          pvNumber: pvNumber,
          issueDate: issueDate,
          violationType: violationType,
          totalReparationAmount: totalReparationAmount,
          totalNonFixed: totalNonFixed,
          subsidizedGood: subsidizedGood,
          offender:
              OffenderModel(name: "John Doe"), // You can adjust this as needed
          inspectors: inspectors,
          seizures: [], // Empty list for seizures as per your requirements
          closure: null, // No closure data included
          nationalCardRegistration:
              null, // No national card registration included
          financialPenalty: null, // No financial penalty included
        ));
      }

      return pvList;
    } catch (e) {
      print("Error fetching PVs within the date range: $e");
      rethrow;
    }
  }

  Future<void> updatePV(PVModel pvModel) async {
    final connection = await getDatabaseConnection();

    try {
      await connection.connection!.transaction((txn) async {
        // Update the main PV table
        print("Updating PV record with ID: ${pvModel.pvId}");
        await txn.query('''
        UPDATE pv SET 
          pv_number = @pvNumber, 
          issue_date = @issueDate, 
          violation_type = @violationType, 
          total_reparation_amount = @totalReparationAmount, 
          total_non_fixed = @totalNonFixed, 
          subsidized_good = @subsidizedGood, 
          individual_id = @individualId, 
          business_id = @businessId
        WHERE pv_id = @pvId
      ''', substitutionValues: {
          'pvId': pvModel.pvId,
          'pvNumber': pvModel.pvNumber,
          'issueDate': pvModel.issueDate,
          'violationType': pvModel.violationType,
          'totalReparationAmount': pvModel.totalReparationAmount,
          'totalNonFixed': pvModel.totalNonFixed,
          'subsidizedGood': pvModel.subsidizedGood,
          'individualId': pvModel.offender?.name,
          'businessId': pvModel.offender?.name ?? 1,
        });

        // Inspectors handling
        print("Handling inspectors for PV ID: ${pvModel.pvId}");
        var existingInspectors = await txn.query('''
        SELECT inspector_id FROM pv_inspector WHERE pv_id = @pvId
      ''', substitutionValues: {'pvId': pvModel.pvId});
        print("Existing Inspectors: $existingInspectors");

        var existingInspectorIds =
            existingInspectors.map((row) => row[0]).toSet();
        var newInspectorIds =
            pvModel.inspectors.map((inspector) => inspector.id).toSet();

        var inspectorsToDelete =
            existingInspectorIds.difference(newInspectorIds);
        print("Inspectors to delete: $inspectorsToDelete");
        for (var inspectorId in inspectorsToDelete) {
          await txn.query('''
          DELETE FROM pv_inspector WHERE pv_id = @pvId AND inspector_id = @inspectorId
        ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'inspectorId': inspectorId
          });
        }

        var inspectorsToAdd = newInspectorIds.difference(existingInspectorIds);
        print("Inspectors to add: $inspectorsToAdd");
        for (var inspectorId in inspectorsToAdd) {
          await txn.query('''
          INSERT INTO pv_inspector (pv_id, inspector_id) VALUES (@pvId, @inspectorId)
        ''', substitutionValues: {
            'pvId': pvModel.pvId,
            'inspectorId': inspectorId
          });
        }

        // Financial penalty
        print("Handling financial penalty for PV ID: ${pvModel.pvId}");
        if (pvModel.financialPenalty != null) {
          var penaltyExists = (await txn.query('''
          SELECT 1 FROM financial_penalty WHERE pv_id = @pvId
        ''', substitutionValues: {'pvId': pvModel.pvId})).isNotEmpty;
          print("Financial penalty exists: $penaltyExists");

          if (penaltyExists) {
            await txn.query('''
            UPDATE financial_penalty SET 
              penalty_amount = @penaltyAmount, 
              penalty_date = @penaltyDate, 
              payment_receipt_number = @paymentReceiptNumber, 
              payment_receipt_date = @paymentReceiptDate
            WHERE pv_id = @pvId
          ''', substitutionValues: {
              'pvId': pvModel.pvId,
              'penaltyAmount': pvModel.financialPenalty!.penaltyAmount,
              'penaltyDate': pvModel.financialPenalty!.penaltyDate,
              'paymentReceiptNumber':
                  pvModel.financialPenalty!.paymentReceiptNumber,
              'paymentReceiptDate':
                  pvModel.financialPenalty!.paymentReceiptDate,
            });
            print("Updated financial penalty for PV ID: ${pvModel.pvId}");
          } else {
            await txn.query('''
            INSERT INTO financial_penalty (pv_id, penalty_amount, penalty_date, payment_receipt_number, payment_receipt_date)
            VALUES (@pvId, @penaltyAmount, @penaltyDate, @paymentReceiptNumber, @paymentReceiptDate)
          ''', substitutionValues: {
              'pvId': pvModel.pvId,
              'penaltyAmount': pvModel.financialPenalty!.penaltyAmount,
              'penaltyDate': pvModel.financialPenalty!.penaltyDate,
              'paymentReceiptNumber':
                  pvModel.financialPenalty!.paymentReceiptNumber,
              'paymentReceiptDate':
                  pvModel.financialPenalty!.paymentReceiptDate,
            });
            print("Inserted financial penalty for PV ID: ${pvModel.pvId}");
          }
        } else {
          print("Deleting financial penalty for PV ID: ${pvModel.pvId}");
          await txn.query('DELETE FROM financial_penalty WHERE pv_id = @pvId',
              substitutionValues: {'pvId': pvModel.pvId});
        }

        // Seizures
        print("Handling seizures for PV ID: ${pvModel.pvId}");
        var existingSeizures = await txn.query('''
        SELECT seizure_id FROM pv_seizure WHERE pv_id = @pvId
      ''', substitutionValues: {'pvId': pvModel.pvId});
        print("Existing Seizures: $existingSeizures");

        var existingSeizureIds = existingSeizures.map((row) {
          var seizureId = row[0];
          return seizureId is int
              ? seizureId
              : int.tryParse(seizureId.toString()) ?? 0;
        }).toSet();

        var newSeizures = pvModel.seizures.map((seizure) => seizure).toList();

        for (var seizureId in existingSeizureIds) {
          if (!newSeizures.any((seizure) => seizure.seizureId == seizureId)) {
            print("Deleting seizure with ID: $seizureId");
            await txn.query(
                'DELETE FROM pv_seizure WHERE seizure_id = @seizureId',
                substitutionValues: {'seizureId': seizureId});
            await txn.query('DELETE FROM seizure WHERE seizure_id = @seizureId',
                substitutionValues: {'seizureId': seizureId});
          }
        }

        for (var seizure in newSeizures) {
          if (existingSeizureIds.contains(seizure.seizureId)) {
            print("Updating seizure with ID: ${seizure.seizureId}");
            await txn.query('''
            UPDATE seizure SET
              seizure_amount = @seizureAmount,
              seizure_quantity = @seizureQuantity,
              seized_goods = @seizedGoods
            WHERE seizure_id = @seizureId
          ''', substitutionValues: {
              'seizureId': seizure.seizureId,
              'seizureAmount': seizure.seizureAmount,
              'seizureQuantity': seizure.seizureQuantity,
              'seizedGoods': seizure.seizedGoods,
            });
          } else {
            print("Inserting new seizure for PV ID: ${pvModel.pvId}");
            var result = await txn.query('''
            INSERT INTO seizure (seizure_amount, seizure_quantity, seized_goods)
            VALUES (@seizureAmount, @seizureQuantity, @seizedGoods) RETURNING seizure_id
          ''', substitutionValues: {
              'seizureAmount': seizure.seizureAmount,
              'seizureQuantity': seizure.seizureQuantity,
              'seizedGoods': seizure.seizedGoods,
            });

            int seizureId = result.first[0];
            print("Linking seizure ID: $seizureId to PV ID: ${pvModel.pvId}");
            await txn.query(
                'INSERT INTO pv_seizure (pv_id, seizure_id) VALUES (@pvId, @seizureId)',
                substitutionValues: {
                  'pvId': pvModel.pvId,
                  'seizureId': seizureId,
                });
          }
        }

        // Closure handling
        print("Handling closure for PV ID: ${pvModel.pvId}");
        if (pvModel.closure != null) {
          var closureExists = (await txn.query('''
          SELECT 1 FROM closure WHERE pv_id = @pvId
        ''', substitutionValues: {'pvId': pvModel.pvId})).isNotEmpty;
          print("Closure exists: $closureExists");

          if (closureExists) {
            await txn.query('''
            UPDATE closure SET
              closure_order_date = @closureOrderDate, 
              reopening_request_number = @reopeningRequestNumber, 
              reporting_date = @reportingDate
            WHERE pv_id = @pvId
          ''', substitutionValues: {
              'pvId': pvModel.pvId,
              'closureOrderDate': pvModel.closure!.closureOrderDate,
              'reopeningRequestNumber': pvModel.closure!.reopeningRequestNumber,
              'reportingDate': pvModel.closure!.reportingDate,
            });
            print("Updated closure for PV ID: ${pvModel.pvId}");
          } else {
            await txn.query('''
            INSERT INTO closure (pv_id, closure_order_date, reopening_request_number, reporting_date)
            VALUES (@pvId, @closureOrderDate, @reopeningRequestNumber, @reportingDate)
          ''', substitutionValues: {
              'pvId': pvModel.pvId,
              'closureOrderDate': pvModel.closure!.closureOrderDate,
              'reopeningRequestNumber': pvModel.closure!.reopeningRequestNumber,
              'reportingDate': pvModel.closure!.reportingDate,
            });
            print("Inserted closure for PV ID: ${pvModel.pvId}");
          }
        } else {
          print("Deleting closure for PV ID: ${pvModel.pvId}");
          await txn.query('DELETE FROM closure WHERE pv_id = @pvId',
              substitutionValues: {'pvId': pvModel.pvId});
        }

        print("Finished updating PV ID: ${pvModel.pvId}");
      });
    } catch (e) {
      print("Error updating PV data: $e");
      rethrow;
    }
  }

  Future<void> deletePV(String pvId) async {
    final connection = await getDatabaseConnection();
    try {
      // Start a transaction to ensure all deletes are done atomically
      await connection.connection!.transaction((txn) async {
        // Delete from the financial_penalty table
        await txn.query('DELETE FROM financial_penalty WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});

        // Delete from the pv_inspector table
        await txn.query('DELETE FROM pv_inspector WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});

        // Delete from the pv_seizure table
        await txn.query('DELETE FROM pv_seizure WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});

        // Delete from the closure table
        await txn.query('DELETE FROM closure WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});

        // Delete from the national_card_reg table
        await txn.query('DELETE FROM national_card_reg WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});

        // Finally, delete from the pv table
        await txn.query('DELETE FROM pv WHERE pv_id = @pvId',
            substitutionValues: {'pvId': pvId});
      });

      print("PV and related data deleted successfully.");
    } catch (e) {
      print("Error deleting PV: $e");
      rethrow;
    }
  }
  Future<List<int>> getMonthlyPVCounts() async {
  final connection = await getDatabaseConnection(); // Get DB connection
  try {
   

    // Query to count PVs for each month in the current year
    final currentYear = DateTime.now().year;
    var result = await connection.connection!.query(''' 
      SELECT 
        EXTRACT(MONTH FROM issue_date) AS month, 
        COUNT(*) AS pv_count
      FROM pv
      WHERE EXTRACT(YEAR FROM issue_date) = @currentYear
      GROUP BY month
      ORDER BY month;
    ''', substitutionValues: {'currentYear': currentYear});

    // Initialize an array with 12 zeros (for 12 months)
    List<int> monthlyPVCounts = List.filled(12, 0);

    // Populate counts for each month
    for (var row in result) {
      int month = (row[0] is String) 
          ? int.parse(row[0]) 
          : (row[0] as double).toInt(); // Handle month value correctly
      int count = row[1] as int; // Ensure the count is treated as an int

      // Fill the correct position in the array
      monthlyPVCounts[month - 1] = count;

    
    }


    return monthlyPVCounts;
  } catch (e) {
    print("Error fetching monthly PV counts: $e");
    rethrow;
  }
}


Future<int> getTotalPVCount() async {
  final connection = await getDatabaseConnection(); // Get DB connection
  try {
    

    // Query to count all PVs regardless of month or year
    var result = await connection.connection!.query(''' 
      SELECT COUNT(*) AS total_pv_count
      FROM pv;

    ''');

    // Extract the total PV count from the query result
    int totalPVCount = result.isNotEmpty ? result.first[0] : 0;

   
    return totalPVCount;
  } catch (e) {
    //rise exception 
    rethrow;
  }
}
}
