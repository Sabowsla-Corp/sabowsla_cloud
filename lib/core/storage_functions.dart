import 'dart:developer';

import 'package:sabowsla_server/core/server_function.dart';
import 'package:sabowsla_server/core/server_funtions.dart';

class StorageFunctions implements ServerFunctions {
  final String? urlPath;
  final String? storagePath;
  StorageFunctions({this.storagePath, this.urlPath});
  @override
  Future<void> saveFile() async {
    log("saving file");
  }

  @override
  Future<void> updateFile() async {}

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
