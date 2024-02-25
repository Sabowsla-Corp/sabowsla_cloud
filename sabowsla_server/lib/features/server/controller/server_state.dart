import 'package:sabowsla_cloud/features/log/models/log_model.dart';
import 'package:sabowsla_cloud/features/server/models/local_server_status.dart';

class ServerState {
  ServerState({
    required this.verbose,
    required this.cors,
    required this.port,
    required this.localServerStatus,
    required this.logs,
    required this.jwtSecret,
    required this.serverUrl,
  });
  final bool cors;
  final int port;
  final bool verbose;
  final LocalServerStatus localServerStatus;
  final List<LogModel> logs;
  final String jwtSecret;
  final String serverUrl;

  ServerState copyWith({
    bool? cors,
    int? port,
    bool? verbose,
    LocalServerStatus? localServerStatus,
    List<LogModel>? logs,
    String? jwtSecret,
    String? serverUrl,
  }) {
    return ServerState(
      serverUrl: serverUrl ?? this.serverUrl,
      cors: cors ?? this.cors,
      port: port ?? this.port,
      verbose: verbose ?? this.verbose,
      localServerStatus: localServerStatus ?? this.localServerStatus,
      logs: logs ?? this.logs,
      jwtSecret: jwtSecret ?? this.jwtSecret,
    );
  }
}
