import 'package:get_it/get_it.dart';
import 'package:sabowsla_server/core/server_funtions.dart';
import 'package:sabowsla_server/core/storage_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/server_stats_model.dart';

var locator = GetIt.instance;

Future<void> injectDependencies() async {
  var serverFunctionsImpl = StorageFunctions(urlPath: 'storage');
  locator.registerLazySingleton<ServerFunctions>(() => serverFunctionsImpl);
  var prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => prefs);
  var serverStats = ServerStats(storage: locator());
  locator.registerLazySingleton(() => serverStats);
}
