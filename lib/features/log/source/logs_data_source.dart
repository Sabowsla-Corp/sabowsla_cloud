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
  List<LogModel> getAll() {
    return logsDb.getAll();
  }

  @override
  Future<List<LogModel>> getByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    await ensureOpen();
    return await box.getLogsByDateRange(
      start: start,
      end: end,
    );
  }

  @override
  Future<List<LogModel>> getByDate({
    required DateTime date,
  }) async {
    await ensureOpen();
    return await box.getLogsByDate(
      date: date,
    );
  }
}
