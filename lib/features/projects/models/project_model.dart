import 'package:isar/isar.dart';

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
}

typedef ProjectModels = List<ProjectModel>;

String formateDateTime(DateTime dateTime) {
  return '${dateTime.day} de ${formateDateTimeMonthsInText(dateTime)} de ${dateTime.year}';
}

String formateDateTimeMonthsInText(DateTime dateTime) {
  String month = dateTime.month.toString();
  switch (month) {
    case '1':
      return 'Ene';
    case '2':
      return 'Feb';
    case '3':
      return 'Mar';
    case '4':
      return 'Abr';
    case '5':
      return 'Mayo';
    case '6':
      return 'Jun';
    case '7':
      return 'Jul';
    case '8':
      return 'Ago';
    case '9':
      return 'Sep';
    case '10':
      return 'Oct';
    case '11':
      return 'Nov';
    case '12':
      return 'Dic';
    default:
      return 'Error';
  }
}
