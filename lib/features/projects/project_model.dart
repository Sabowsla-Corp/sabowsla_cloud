import 'package:isar/isar.dart';

part 'project_model.g.dart';

@collection
class ProjectModel {
  ProjectModel({
    required this.name,
    required this.basePath,
    required this.uid,
    this.id = Isar.autoIncrement,
  });

  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  final String name;
  @Index(type: IndexType.value)
  final String basePath;
  @Index(type: IndexType.value)
  final String uid;
}
