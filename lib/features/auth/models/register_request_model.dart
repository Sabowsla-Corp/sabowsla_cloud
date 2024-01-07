import 'package:copy_with_extension/copy_with_extension.dart';

part 'register_request_model.g.dart';

@CopyWith()
class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
