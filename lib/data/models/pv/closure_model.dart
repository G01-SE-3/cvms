import 'package:cvms/domain/entities/pv/closure.dart';

class ClosureModel {
  final int closureId;
  final DateTime closureOrderDate;
  final String? reopeningRequestNumber;
  final DateTime? reportingDate;

  ClosureModel({
    required this.closureId,
    required this.closureOrderDate,
    this.reopeningRequestNumber,
    this.reportingDate,
  });

  Closure toEntity() {
    return Closure(
      closureId: closureId,
      closureOrderDate: closureOrderDate,
      reopeningRequestNumber: reopeningRequestNumber,
    );
  }
}
