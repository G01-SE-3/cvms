import 'package:cvms/domain/entities/pv/seizure.dart';

class SeizureModel {
  final int seizureId;
  final String seizureAmount;
  final String seizureQuantity;
  final String seizedGoods;

  SeizureModel({
    required this.seizureId,
    required this.seizureAmount,
    required this.seizureQuantity,
    required this.seizedGoods,
  });

  Seizure toEntity() {
    return Seizure(
      seizureAmount: seizureAmount,
      seizureQuantity: seizureQuantity,
      seizedGoods: seizedGoods,
    );
  }
}
