import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/log/models/log_model.dart';
import 'package:sabowsla_server/objectbox/objectbox.g.dart';

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
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
