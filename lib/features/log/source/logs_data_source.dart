import 'package:sabowsla_server/features/log/models/log_model.dart';
import 'package:sabowsla_server/objectbox.dart';
import 'package:sabowsla_server/objectbox/objectbox.g.dart';

abstract class LogsDataSource {
  List<LogModel> getAll();
  Future<List<LogModel>> getByDateRange({
    required DateTime start,
    required DateTime end,
  });
  Future<List<LogModel>> getByDate({
    required DateTime date,
  });

  late final ObjectBox box;
}

class LogsDataSourceImpl implements LogsDataSource {
  LogsDataSourceImpl(this.box);

  @override
  late final ObjectBox box;
  Box<LogModel> get logsDb => box.logsDb;

  @override
  List<LogModel> getAll() => logsDb.getAll();

  @override
  Future<List<LogModel>> getByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    return logsDb
        .query(
          LogModel_.date.between(
            start.millisecondsSinceEpoch,
            end.millisecondsSinceEpoch,
          ),
        )
        .build()
        .find();
  }

  @override
  Future<List<LogModel>> getByDate({
    required DateTime date,
  }) async {
    return logsDb
        .query(LogModel_.date.equals(date.millisecondsSinceEpoch))
        .build()
        .find();
  }
}
