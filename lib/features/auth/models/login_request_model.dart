import 'package:copy_with_extension/copy_with_extension.dart';

part 'login_request_model.g.dart';

@CopyWith()
class LoginRequest {
  LoginRequest({required this.email, required this.password});
  String email;
  String password;

  static LoginRequest fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
