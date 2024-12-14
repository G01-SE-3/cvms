import 'package:cvms/domain/entities/inspector/inspector.dart';

abstract class InspectorRepository {
  Future<List<InspectorEntity>> getAllInspectors();
  Future<InspectorEntity?> getInspectorById(int id);
  Future<void> addInspector(InspectorEntity inspector);
  Future<void> updateInspector(InspectorEntity inspector); 
  Future<void> deleteInspector(InspectorEntity inspector);  
}
