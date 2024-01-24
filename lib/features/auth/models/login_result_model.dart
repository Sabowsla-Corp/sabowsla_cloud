import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

class LoginResult {
  LoginResult({
    this.error,
    this.userCredential,
  });
  LoginError? error;
  final UserCredential? userCredential;

  Map<String, dynamic> toJson() => {
        'error': error,
        'userCredential': userCredential,
      };
}

enum LoginError {
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}
