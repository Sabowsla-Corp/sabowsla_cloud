import 'package:isar/isar.dart';
import 'package:sabowsla_cloud/features/log/models/log_model.dart';

abstract class LogsDataSource {
  List<LogModel> getAll();
  Future<List<LogModel>> getByDateRange({
    required DateTime start,
    required DateTime end,
  });
  Future<List<LogModel>> getByDate({
    required DateTime date,
  });

  late final Isar logsDb;
}

class LogsDataSourceImpl implements LogsDataSource {
  LogsDataSourceImpl(this.logsDb);

  @override
  late final Isar logsDb;

  @override
  List<LogModel> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<List<LogModel>> getByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    throw UnimplementedError();
    /*
    return logsDb
        .query(
          LogModel_.date.between(
            start.millisecondsSinceEpoch,
            end.millisecondsSinceEpoch,
          ),
        )
        .build()
        .find();
        */
  }

  @override
  Future<List<LogModel>> getByDate({
    required DateTime date,
  }) async {
    throw UnimplementedError();
    /*

    return logsDb
        .query(LogModel_.date.equals(date.millisecondsSinceEpoch))
        .build()
        .find();
        */
  }
}
