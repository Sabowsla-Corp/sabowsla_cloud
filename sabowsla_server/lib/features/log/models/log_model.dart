import 'package:isar/isar.dart';

part 'log_model.g.dart';

@collection
class LogModel {
  LogModel({
    required this.log,
    required this.date,
    required this.severity,
    required this.source,
    this.id = 0,
  });

  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  final String log;
  @Index(type: IndexType.value)
  final DateTime date;
  @Index(type: IndexType.value)
  final String severity;
  @Index(type: IndexType.value)
  final String source;

  LogModel copyWith({
    int? id,
    String? log,
    DateTime? date,
    String? severity,
    String? source,
  }) {
    return LogModel(
      id: id ?? this.id,
      log: log ?? this.log,
      date: date ?? this.date,
      severity: severity ?? this.severity,
      source: source ?? this.source,
    );
  }
}
