import 'package:sabowsla_server/objectbox/objectbox.g.dart';

@Entity()
class LogModel {
  LogModel({
    required this.log,
    required this.date,
    required this.severity,
    required this.source,
    this.id = 0,
  });

  @Id()
  int id;
  @Property()
  final String log;
  @Property()
  final String date;
  @Property()
  final String severity;
  @Property()
  final String source;

  LogModel copyWith({
    int? id,
    String? log,
    String? date,
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
