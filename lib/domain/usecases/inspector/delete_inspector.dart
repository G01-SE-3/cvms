import 'package:cvms/domain/entities/inspector/inspector.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';


class DeleteInspectorUseCase {
  final InspectorRepository repository;

  DeleteInspectorUseCase(this.repository);

  Future<void> call(InspectorEntity inspector) async {
    try {
      await repository.deleteInspector(inspector);
    } catch (e) {
      throw Exception('Failed to delete inspector: $e');
    }
  }
}
