import 'package:cvms/data/models/pv/closure_model.dart';

class Closure {
  final int closureId;
  final DateTime closureOrderDate;
  final String? reopeningRequestNumber;
  final DateTime? reportingDate;
  Closure(
      {required this.closureId,
      required this.closureOrderDate,
      this.reopeningRequestNumber,
      this.reportingDate});

  ClosureModel toModel() {
    return ClosureModel(
      closureId: closureId,
      closureOrderDate: closureOrderDate,
      reopeningRequestNumber: reopeningRequestNumber,
    );
  }
}
