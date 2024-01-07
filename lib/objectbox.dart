import 'package:sabowsla_server/features/auth/models/register_result_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/objectbox/objectbox.g.dart';

class ObjectBox {
  ObjectBox(this.store);

  ObjectBox._create(this.store) {
    _usersDb = Box<UserCredential>(store);
  }
  bool logLevel = true;
  late Store store;

  late final Box<UserCredential> _usersDb;
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  Future<RegisterResult> register(final UserCredential user) async {
    var result = RegisterResult(error: '', userCredential: null);

    final userExists = _usersDb
        .query(UserCredential_.email.equals(user.email))
        .build()
        .findFirst();

    if (userExists != null) {
      result.error = 'exists';
      return result;
    } else {
      _usersDb.put(user);
    }
    return result;
  }
}
