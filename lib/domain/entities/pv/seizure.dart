import 'package:cvms/data/models/pv/seizure_model.dart';

class Seizure {
  final String seizureAmount;
  final String seizureQuantity;
  final String seizedGoods;

  Seizure({
    required this.seizureAmount,
    required this.seizureQuantity,
    required this.seizedGoods,
  });
  SeizureModel toModel() {
    return SeizureModel(
      seizureId: 0,
      seizureAmount: seizureAmount,
      seizureQuantity: seizureQuantity,
      seizedGoods: seizedGoods,
    );
  }
}
