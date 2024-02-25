import 'user_credential_model.dart';

class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.passwordHash,
  });
  final String email;
  final String passwordHash;

  Map<String, dynamic> toJson() => {
        'email': email,
        'passwordHash': passwordHash,
      };

  UserCredential get asUserCredential => UserCredential(
        email: email,
        displayName: email,
        uid: '',
        creationDate: DateTime.now(),
        photoBase64: '',
        passwordHash: passwordHash,
      );
}
