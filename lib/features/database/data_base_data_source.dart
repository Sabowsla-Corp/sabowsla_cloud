import 'dart:developer';

import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/objectbox.dart';

var dataBaseDataSource = DatabaseDataSourceImpl();

abstract class DatabaseDataSource {
  Future<List<UserCredential>> getUsers({
    required int limit,
    required int offset,
  });
}

class DatabaseDataSourceImpl implements DatabaseDataSource {
  DatabaseDataSourceImpl() {
    openDataBase();
  }

  void openDataBase() async {
    try {
      dataBase = await ObjectBox.create();
      log('Database opened');
    } catch (e) {
      log('Database failed to open');
    }
  }

  late final ObjectBox dataBase;

  @override
  Future<List<UserCredential>> getUsers({
    required int offset,
    int limit = 50,
  }) async {
    return await dataBase.getUsers(
      limit: limit,
      offset: offset,
    );
  }

  Future<void> registerUser() async {}
}
