import 'user_credential_model.dart';

class RegisterResult {
  RegisterResult({
    this.error,
    this.userCredential,
  });
  RegisterError? error;
  final UserCredential? userCredential;

  Map<String, dynamic> toJson() => {
        'error': error,
        'userCredential': userCredential,
      };
}

enum RegisterError {
  emailAlreadyInUse,
  invalidEmail,
  operationNotAllowed,
  weakPassword,
  userDisabled,
  userNotFound,
  wrongPassword,
  unknown,
}
