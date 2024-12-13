class PVInspector {
  final String pvId; // FK to PV
  final int inspectorId; // FK to Inspector

  PVInspector({
    required this.pvId,
    required this.inspectorId,
  });
}
