import 'dart:developer';

import 'package:path_provider/path_provider.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_cloud/features/log/models/log_model.dart';
import 'package:sabowsla_cloud/objectbox/objectbox.g.dart';

class ObjectBox {
  ObjectBox(this.store);

  ObjectBox._create(this.store) {
    usersDb = Box<UserCredential>(store);
    logsDb = Box<LogModel>(store);
  }
  late final Box<UserCredential> usersDb;
  late final Box<LogModel> logsDb;
  bool logLevel = true;
  late Store store;

  static Future<ObjectBox> create() async {
    try {
      final store = await openStore();
      return ObjectBox._create(store);
    } catch (e) {
      log('Error creating objectbox: $e');
      var newPath = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: newPath.path);
      return ObjectBox._create(store);
    }
  }
}
