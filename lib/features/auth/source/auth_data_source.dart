import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sabowsla_server/features/auth/models/delete_user_result.dart';
import 'package:sabowsla_server/features/auth/models/login_request_model.dart';
import 'package:sabowsla_server/features/auth/models/login_result_model.dart';
import 'package:sabowsla_server/features/auth/models/register_request_model.dart';
import 'package:sabowsla_server/features/auth/models/register_result_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/objectbox/objectbox.g.dart';
import 'package:uuid/uuid.dart';

var authDataSource = AuthDataSourceImpl();

abstract class AuthDataSource {
  Future<LoginResult> login(LoginRequest request);
  Future<RegisterResult> register(RegisterRequest request);
  Future<DeleteUserResult> deleteUser(String uid);
  Future<List<UserCredential>> getAllUsers();
  int countUsers();
  late Box<UserCredential> usersDb;
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl();

  @override
  late Box<UserCredential> usersDb;

  @override
  int countUsers() {
    return usersDb.count();
  }

  @override
  Future<DeleteUserResult> deleteUser(String uid) async {
    final user =
        usersDb.query(UserCredential_.uid.equals(uid)).build().findFirst();
    if (user != null) {
      usersDb.remove(user.id);
      return DeleteUserResult.success;
    }
    return DeleteUserResult.userNotFound;
  }

  @override
  Future<RegisterResult> register(RegisterRequest request) async {
    var user = request.asUserCredential;
    var generatedUID = const Uuid().v4();
    user.uid = generatedUID;
    user.creationDate = DateTime.now();
    var emailValid = EmailValidator.validate(request.email);

    if (!emailValid) {
      log('The email ${request.email} is not valid');
      return RegisterResult(error: RegisterError.invalidEmail);
    }

    if (user.passwordHash.isEmpty) {
      return RegisterResult(error: RegisterError.weakPassword);
    }

    final userExists = usersDb
        .query(UserCredential_.email.equals(request.email))
        .build()
        .findFirst();

    if (userExists != null) {
      if (kDebugMode) {
        print(
          "The ${request.email} is already in use in userCredential $userExists",
        );
      }
      return RegisterResult(error: RegisterError.emailAlreadyInUse);
    } else {
      usersDb.put(user);
    }
    return RegisterResult(userCredential: user);
  }

  @override
  Future<List<UserCredential>> getAllUsers() async {
    return await usersDb.getAllAsync();
  }

  Future<List<UserCredential>> getUsersByCreationDate({
    required DateTimeRange range,
  }) async {
    final query = usersDb.query(
      UserCredential_.creationDate.between(
        range.start.millisecondsSinceEpoch,
        range.end.millisecondsSinceEpoch,
      ),
    );
    return query.build().find();
  }

  @override
  Future<LoginResult> login(LoginRequest request) async {
    final user = usersDb
        .query(UserCredential_.email.equals(request.email))
        .build()
        .findFirst();
    if (user == null) {
      return LoginResult(error: LoginError.userNotFound);
    }
    if (user.passwordHash == request.password) {
      return LoginResult(userCredential: user);
    }
    return LoginResult(error: LoginError.unknown);
  }
}
