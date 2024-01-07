import 'package:sabowsla_server/features/auth/models/login_request_model.dart';
import 'package:sabowsla_server/features/auth/models/register_request_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

abstract class AuthDataSource {
  Future<UserCredential> login(LoginRequest request);
  Future<UserCredential> register(RegisterRequest request);
  Future<bool> loginWithEmail(LoginRequest request);
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<UserCredential> login(LoginRequest request) async {
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> register(RegisterRequest request) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithEmail(LoginRequest request) async {
    throw UnimplementedError();
  }
}
