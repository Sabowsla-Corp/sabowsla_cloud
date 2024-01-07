import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

class RegisterResult {
  RegisterResult({
    required this.error,
    required this.userCredential,
  });
  String error;
  final UserCredential? userCredential;

  Map<String, dynamic> toJson() => {
        'error': error,
        'userCredential': userCredential,
      };
}
