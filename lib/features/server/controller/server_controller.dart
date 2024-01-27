import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/features/log/models/log_model.dart';
import 'package:sabowsla_cloud/features/server/controller/server_state.dart';
import 'package:sabowsla_cloud/features/server/models/local_server_status.dart';
import 'package:sabowsla_cloud/features/server/source/server_data_source.dart';

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
        serverUrl: '',
      );

  void setPort(int port) {
    state = state.copyWith(port: port);
  }

  void setCors(bool cors) {
    state = state.copyWith(cors: cors);
  }

  void toggleServerStatus() async {
    if (state.localServerStatus == LocalServerStatus.stopped) {
      log('Starting server');
      state = state.copyWith(localServerStatus: LocalServerStatus.starting);
      var settings = ServerSettings(
        cors: state.cors,
        port: state.port,
        verbose: state.verbose,
        jwtSecret: state.jwtSecret,
      );
      var serverUrl = await sabowslaServer.start(settings);
      if (serverUrl is String) {
        state = state.copyWith(
          localServerStatus: LocalServerStatus.running,
          serverUrl: serverUrl,
        );
        log('Server running at:  ');
        log(serverUrl);
      } else {
        state = state.copyWith(localServerStatus: LocalServerStatus.stopped);
      }
    } else if (state.localServerStatus == LocalServerStatus.running) {
      state = state.copyWith(localServerStatus: LocalServerStatus.stopping);
      bool stoped = await sabowslaServer.stop();
      if (stoped) {
        state = state.copyWith(localServerStatus: LocalServerStatus.stopped);
        log('Local server stopped');
      } else {
        state = state.copyWith(localServerStatus: LocalServerStatus.running);
        log('Error stopping local server');
      }
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
