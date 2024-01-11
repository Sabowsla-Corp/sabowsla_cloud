import 'dart:developer';

import 'package:sabowsla_server/features/auth/models/register_result_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/objectbox.dart';

var dataBaseDataSource = DatabaseDataSourceImpl();

abstract class DatabaseDataSource {
  Future<List<UserCredential>> getUsers({
    required int limit,
    required int offset,
  });
  Future<RegisterResult> registerUser(UserCredential user);
  Future<bool> deleteUser(String uid);
}

class DatabaseDataSourceImpl implements DatabaseDataSource {
  DatabaseDataSourceImpl();
  bool open = false;

  Future openDataBase() async {
    try {
      dataBase = await ObjectBox.create();
      log('Database opened');
    } catch (e) {
      log('Database failed to open $e');
    }
  }

  Future ensureOpen() async {
    if (!open) {
      await openDataBase();
      open = true;
    }
  }

  late final ObjectBox dataBase;

  @override
  Future<List<UserCredential>> getUsers({
    required int offset,
    int limit = 1000000,
  }) async {
    await ensureOpen();
    return await dataBase.getUsers(
      limit: limit,
      offset: offset,
    );
  }

  Future<int> countUsers() async {
    await ensureOpen();
    return dataBase.countUsers();
  }

  @override
  Future<RegisterResult> registerUser(UserCredential user) async {
    await ensureOpen();
    return await dataBase.register(user);
  }

  @override
  Future<bool> deleteUser(String uid) async {
    await ensureOpen();
    return await dataBase.deleteUser(uid);
  }
}
