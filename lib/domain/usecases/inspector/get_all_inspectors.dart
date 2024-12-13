import '/../domain/repositories/inspector/inspector_repository.dart';
import '../../entities/inspector/inspector.dart';

class GetAllInspectors {
  final InspectorRepository repository;

  GetAllInspectors(this.repository);

  Future<List<InspectorEntity>> execute() async {
    return await repository.getAllInspectors();
  }
}
