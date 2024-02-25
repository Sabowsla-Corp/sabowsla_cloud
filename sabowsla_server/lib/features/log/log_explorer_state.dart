import 'package:sabowsla_cloud/features/log/models/log_model.dart';

class LogExplorerState {
  LogExplorerState({required this.logs});

  final List<LogModel> logs;

  LogExplorerState copyWith({
    List<LogModel>? logs,
  }) {
    return LogExplorerState(
      logs: logs ?? this.logs,
    );
  }
}
