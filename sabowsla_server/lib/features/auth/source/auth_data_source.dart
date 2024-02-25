import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/features/auth/models/delete_user_result.dart';
import 'package:sabowsla_cloud/features/auth/models/login_request_model.dart';
import 'package:sabowsla_cloud/features/auth/models/login_result_model.dart';
import 'package:sabowsla_cloud/features/auth/models/register_request_model.dart';
import 'package:sabowsla_cloud/features/auth/models/register_result_model.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:uuid/uuid.dart';

var authDataSourceProvider = Provider<AuthDataSource>(
  (ref) =>
      throw UnimplementedError('Auth Data Source Has Not Been Implemented'),
);

abstract class AuthDataSource {
  Future<LoginResult> login(LoginRequest request);
  Future<RegisterResult> register(RegisterRequest request);
  Future<DeleteUserResult> deleteUser(String uid);
  Future<List<UserCredential>> getAllUsers();
  Future<int> countUsers();
  late final Isar usersDb;
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(this.usersDb);

  @override
  late final Isar usersDb;

  @override
  Future<int> countUsers() async {
    return await usersDb.userCredentials.count();
  }

  @override
  Future<DeleteUserResult> deleteUser(String uid) async {
    bool deleted = await usersDb.collection().deleteByIndex('uid', [uid]);
    return deleted ? DeleteUserResult.success : DeleteUserResult.userNotFound;
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
/*
    final userExists = usersDb.attachCollections()

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
  */
    return RegisterResult(userCredential: user);
  }

  @override
  Future<List<UserCredential>> getAllUsers() async {
    //return await usersDb.getAllAsync();
    throw UnimplementedError();
  }

  Future<List<UserCredential>> getUsersByCreationDate({
    required DateTimeRange range,
  }) async {
    /*
    final query = usersDb.query(
      UserCredential_.creationDate.between(
        range.start.millisecondsSinceEpoch,
        range.end.millisecondsSinceEpoch,
      ),
    );
    */
    throw UnimplementedError();
  }

  @override
  Future<LoginResult> login(LoginRequest request) async {
    /*
      final user = usersDb
  
        .query(UserCredential_.email.equals(request.email))
        .build()
        .findFirst();
        */
    throw UnimplementedError();
    /*
    if (user == null) {
      return LoginResult.errored(
        LoginError.userNotFound,
      );
    }
    if (user.passwordHash == request.password) {
      //Create a token for this user using crypto package
      var jwtToken = createJwt(user.toMapSimple(), jwtSecret);

      return LoginResult.success(user, jwtToken);
    }
    return LoginResult.errored(
      LoginError.wrongPassword,
    );*/
  }
}
