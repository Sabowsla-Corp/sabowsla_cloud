import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:sabowsla_server/features/auth/models/register_result_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/objectbox/objectbox.g.dart';
import 'package:uuid/uuid.dart';

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
    var generatedUID = const Uuid().v4();
    user.uid = generatedUID;
    user.creationDate = DateTime.now().toString();
    var emailValid = EmailValidator.validate(user.email);

    if (!emailValid) {
      log('The email ${user.email} is not valid');
      return RegisterResult(error: RegisterError.invalidEmail);
    }
    if (user.passwordHash.isEmpty) {
      return RegisterResult(error: RegisterError.weakPassword);
    }

    final userExists = _usersDb
        .query(UserCredential_.email.equals(user.email))
        .build()
        .findFirst();

    if (userExists != null) {
      print(
        "The ${user.email} is already in use in userCredential $userExists",
      );
      return RegisterResult(error: RegisterError.emailAlreadyInUse);
    } else {
      _usersDb.put(user);
    }
    return RegisterResult(userCredential: user);
  }

  Future<List<UserCredential>> getUsers({
    required int limit,
    required int offset,
  }) async {
    return _usersDb.getAll().skip(offset).take(limit).toList();
  }
}
