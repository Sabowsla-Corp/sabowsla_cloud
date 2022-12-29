import 'dart:developer';
import 'dart:io';

import 'package:body_parser/body_parser.dart';
import 'package:sabowsla_server/core/server_function.dart';
import 'package:sabowsla_server/core/server_funtions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthFunctions implements ServerFunctions {
  final String urlPath;
  final String databaseKey;

  final SharedPreferences prefs;

  AuthFunctions(
    this.prefs, {
    this.urlPath = 'auth',
    this.databaseKey = 'authUsersKey',
  }) {
    loadUsersDatabase();
  }

  Future<void> signUp({HttpRequest? request}) async {
    BodyParseResult result = await parseBody(request);
    log(result.body.toString());
    String userEmail = result.body['user-email'];
    String hashedPassword = result.body['password'];
    bool validEmail = await isEmailValid(userEmail);
    if (validEmail == false) {
      request?.response
        ?..statusCode = 401
        ..write("invalid-email")
        ..close();
    }

    //Todo: save the user if not registered already
  }

  Future<bool> isEmailValid(String email) async {
    //TODO: implement email validation
    return true;
  }

  Future<void> signIn() async {}

  void updateStoragePath(String newStoragePath) {}

  void loadUsersDatabase() {}

  @override
  @override
  List<ServerFunction> get props => [
        ServerFunction(
          name: 'signUp',
          method: signUp(),
        ),
        ServerFunction(
          name: 'signIn',
          method: signIn(),
        ),
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
