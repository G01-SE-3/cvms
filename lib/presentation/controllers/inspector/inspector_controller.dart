import 'package:cvms/domain/usecases/inspector/get_all_inspectors.dart';

class InspectorController {
  final GetAllInspectors getAllInspectors;

  InspectorController(this.getAllInspectors);

  Future<void> loadInspectors() async {
    final inspectors = await getAllInspectors.execute();
    
  }
}
