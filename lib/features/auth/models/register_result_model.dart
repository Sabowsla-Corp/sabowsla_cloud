import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';

part 'register_result_model.g.dart';

@CopyWith()
class RegisterResult {
  RegisterResult({
    required this.error,
    required this.userCredential,
  });
  final String error;
  final UserCredential? userCredential;

  Map<String, dynamic> toJson() => {
        'error': error,
        'userCredential': userCredential,
      };
}
