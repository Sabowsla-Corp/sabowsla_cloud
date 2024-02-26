import 'package:sabowsla_auth/sabowsla_auth.dart';

class IsarClientOptions {
  final String schema;

  const IsarClientOptions({this.schema = 'public'});
}

class AuthClientOptions {
  final bool autoRefreshToken;
  final SabowslaAuthAsyncStorage? pkceAsyncStorage;
  final AuthFlowType authFlowType;

  const AuthClientOptions({
    this.autoRefreshToken = true,
    this.pkceAsyncStorage,
    this.authFlowType = AuthFlowType.pkce,
  });
}

class StorageClientOptions {
  final int retryAttempts;

  const StorageClientOptions({this.retryAttempts = 0});
}
