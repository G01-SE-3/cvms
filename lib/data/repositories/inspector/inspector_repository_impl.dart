import 'package:cvms/data/datasources/inspector/inspector_datasource.dart';
import 'package:cvms/domain/repositories/inspector/inspector_repository.dart';
import '../../models/inspector/inspector_model.dart';
import '../../../domain/entities/inspector/inspector.dart';

class InspectorRepositoryImpl implements InspectorRepository {
  final InspectorDatasource _datasource = InspectorDatasource();

  @override
  Future<List<InspectorEntity>> getAllInspectors() async {
    final inspectors = await _datasource.fetchAllInspectors();
    return inspectors.map((model) => toEntity(model)).toList();
  }

  @override
  Future<InspectorEntity?> getInspectorById(int id) async {
    final inspector = await _datasource.fetchInspectorById(id);
    return inspector != null ? toEntity(inspector) : null;
  }

  @override
  Future<void> addInspector(InspectorEntity inspector) async {
    final inspectorModel = InspectorModel(
      id: inspector.inspectorNumber != 0
          ? inspector.inspectorNumber
          : null,

      name: inspector.name.isNotEmpty ? inspector.name : 'Default Name',
      surname: inspector.surname.isNotEmpty ? inspector.surname : 'Default Surname',

      badgeNumber: inspector.badgeNumber != null && inspector.badgeNumber != 0
          ? inspector.badgeNumber
          : null,

      assignedDepartment: inspector.assignedDepartment.isNotEmpty == true
          ? inspector.assignedDepartment
          : null,

      contactNumber: inspector.contactNumber != 0
          ? inspector.contactNumber
          : null,
    );

    await _datasource.addInspector(inspectorModel);
  }

  @override
  Future<void> updateInspector(InspectorEntity inspector) async {
    final inspectorModel = InspectorModel(
      id: inspector.inspectorNumber != 0
          ? inspector.inspectorNumber
          : null,
      name: inspector.name.isNotEmpty ? inspector.name : 'Default Name',
      surname: inspector.surname.isNotEmpty ? inspector.surname : 'Default Surname',
      badgeNumber: inspector.badgeNumber != null && inspector.badgeNumber != 0
          ? inspector.badgeNumber
          : null,
      assignedDepartment: inspector.assignedDepartment.isNotEmpty == true
          ? inspector.assignedDepartment
          : null,
      contactNumber: inspector.contactNumber != 0
          ? inspector.contactNumber
          : null,
    );

    await _datasource.updateInspector(inspectorModel);  // Ensure this method is implemented in your datasource
  }

   @override
  Future<void> deleteInspector(InspectorEntity inspector) async {
    try {
      await _datasource.deleteInspector(inspector.inspectorNumber);
    } catch (e) {
      throw Exception('Failed to delete inspector');
    }
  }
  InspectorEntity toEntity(InspectorModel model) {
    return InspectorEntity(
      inspectorNumber: model.id ?? 0,
      name: model.name,
      surname: model.surname,
      badgeNumber: model.badgeNumber ?? 0,
      assignedDepartment: model.assignedDepartment ?? '',
      contactNumber: model.contactNumber ?? 0,
    );
  }
}
