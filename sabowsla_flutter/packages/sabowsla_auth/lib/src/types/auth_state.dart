import 'package:sabowsla_auth/src/constants.dart';
import 'package:sabowsla_auth/src/types/session.dart';

class AuthState {
  final AuthChangeEvent event;
  final Session? session;

  AuthState(this.event, this.session);
}
