import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:sabowsla_server/core/server_function.dart';
import 'package:sabowsla_server/core/server_funtions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageFunctions implements ServerFunctions {
  final String? urlPath;
  final BehaviorSubject<String?> storagePath = BehaviorSubject.seeded(null);

  final SharedPreferences prefs;
  StorageFunctions(this.prefs, {this.urlPath}) {
    loadStoragePath();
  }
  @override
  Future<void> saveFile() async {
    log("saving file");
  }

  @override
  Future<void> updateFile() async {}

  void updateStoragePath(String newStoragePath) {
    storagePath.add(newStoragePath);
    prefs.setString("sabowslaStorageFunctionsKey", newStoragePath);
  }

  void loadStoragePath() {
    storagePath.add(prefs.getString('sabowslaStorageFunctionsKey'));
  }

  @override
  @override
  List<ServerFunction> get props => [
        ServerFunction(
          name: 'saveFile',
          method: saveFile(),
        ),
        ServerFunction(
          name: 'updateFile',
          method: updateFile(),
        ),
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
