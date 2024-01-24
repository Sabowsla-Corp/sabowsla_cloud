import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_server/features/server/controller/server_state.dart';
import 'package:sabowsla_server/features/server/models/local_server_status.dart';

part 'server_controller.g.dart';

@riverpod
class ServerController extends _$ServerController {
  @override
  ServerState build() => ServerState(
        cors: false,
        port: 1203,
        verbose: false,
        localServerStatus: LocalServerStatus.stopped,
      );

  void setPort(int port) {
    state = state.copyWith(port: port);
  }

  void setCors(bool cors) {
    state = state.copyWith(cors: cors);
  }

  void toggleServerStatus() async {
    if (state.localServerStatus == LocalServerStatus.stopped) {
      state = state.copyWith(localServerStatus: LocalServerStatus.starting);
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(localServerStatus: LocalServerStatus.running);
    } else {
      state = state.copyWith(localServerStatus: LocalServerStatus.stopped);
    }
  }

  void setVerbose(bool verbose) {
    state = state.copyWith(verbose: verbose);
  }
}
