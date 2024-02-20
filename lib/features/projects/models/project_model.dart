import 'dart:io';

import 'package:isar/isar.dart';
import 'package:sabowsla_cloud/core/extensions/string_extensions.dart';

part 'project_model.g.dart';

@collection
class ProjectModel {
  ProjectModel({
    required this.name,
    required this.basePath,
    required this.uid,
    required this.createdAt,
    this.id = Isar.autoIncrement,
  });

  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  final String name;
  @Index(type: IndexType.value)
  final String basePath;
  @Index(type: IndexType.value)
  final String uid;
  @Index(type: IndexType.value)
  final DateTime createdAt;

  @ignore
  String get createdAtFormatted => createdAt.toLocal().toString();
  @ignore
  String get createdAtFormattedShort => formateDateTime(createdAt);
  @ignore
  String get authDirectory => '$basePath/auth';
  @ignore
  List<DataBaseSchema> get databaseSchemas => [
        (Directory('$basePath/posts'), []),
        (Directory('$basePath/reposts'), []),
        (Directory('$basePath/comments'), []),
        (Directory('$basePath/likes'), []),
        (Directory('$basePath/followers'), []),
        (Directory('$basePath/following'), []),
        (Directory('$basePath/notifications'), []),
        (Directory('$basePath/messages'), []),
        (Directory('$basePath/chats'), []),
        (Directory('$basePath/rooms'), []),
      ];
}

typedef DataBaseSchema = (Directory, List<CollectionSchema<dynamic>>);
