import 'user_credential_model.dart';

class LoginResult {
  LoginResult({
    required this.error,
    required this.userCredential,
    required this.jwtToken,
  });
  LoginError? error;
  final UserCredential? userCredential;
  final String? jwtToken;

  Map<String, dynamic> toJson() => {
        'error': error,
        'userCredential': userCredential,
        'jwtToken': jwtToken,
      };

  static LoginResult success(UserCredential userCredential, String jwtToken) {
    return LoginResult(
      error: null,
      userCredential: userCredential,
      jwtToken: jwtToken,
    );
  }

  static LoginResult errored(LoginError error) {
    return LoginResult(
      error: error,
      userCredential: null,
      jwtToken: null,
    );
  }
}

enum LoginError {
  invalidEmail,
  operationNotAllowed,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}
