import 'package:sabowsla_server/features/server/models/local_server_status.dart';

class ServerState {
  ServerState({
    required this.verbose,
    required this.cors,
    required this.port,
    required this.localServerStatus,
  });
  final bool cors;
  final int port;
  final bool verbose;
  final LocalServerStatus localServerStatus;
  ServerState copyWith({
    bool? cors,
    int? port,
    bool? verbose,
    LocalServerStatus? localServerStatus,
  }) {
    return ServerState(
      cors: cors ?? this.cors,
      port: port ?? this.port,
      verbose: verbose ?? this.verbose,
      localServerStatus: localServerStatus ?? this.localServerStatus,
    );
  }
}
