import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_server/features/log/models/log_model.dart';
import 'package:sabowsla_server/features/server/controller/server_state.dart';
import 'package:sabowsla_server/features/server/models/local_server_status.dart';
import 'package:sabowsla_server/features/server/source/server_data_source.dart';

part 'server_controller.g.dart';

@riverpod
class ServerController extends _$ServerController {
  @override
  ServerState build() => ServerState(
        cors: false,
        port: 1203,
        verbose: false,
        localServerStatus: LocalServerStatus.stopped,
        logs: [],
        jwtSecret: 'REPLACE-WITH-YOUR-SECRET-KEY',
      );

  void setPort(int port) {
    state = state.copyWith(port: port);
  }

  void setCors(bool cors) {
    state = state.copyWith(cors: cors);
  }

  void toggleServerStatus() async {
    if (state.localServerStatus == LocalServerStatus.stopped) {
      log('Starting local server');
      state = state.copyWith(localServerStatus: LocalServerStatus.starting);
      var settings = ServerSettings(
        cors: state.cors,
        port: state.port,
        verbose: state.verbose,
        jwtSecret: state.jwtSecret,
      );
      var error = await sabowslaServer.start(settings);
      if (error is String) {
        state = state.copyWith(localServerStatus: LocalServerStatus.stopped);
        log('Error starting local server: $error');
      } else {
        state = state.copyWith(localServerStatus: LocalServerStatus.running);
        log('Local server started at port ${state.port}');
      }
    } else {
      state = state.copyWith(localServerStatus: LocalServerStatus.stopped);
    }
  }

  void log(String log) {
    state = state.copyWith(
      logs: [
        ...state.logs,
        LogModel(
          log: log,
          date: DateTime.now(),
          severity: 'info',
          source: 'server',
        ),
      ],
    );
  }

  void setVerbose(bool verbose) {
    state = state.copyWith(verbose: verbose);
  }
}
