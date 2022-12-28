import 'package:get_it/get_it.dart';
import 'package:sabowsla_server/core/storage_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/server_stats_model.dart';

var locator = GetIt.instance;

Future<void> injectDependencies() async {
  //Always register the shared preferences as is the entry point for finding the databases and functions
  var prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => prefs);

  //Register storage functions on the server, might be available or disallowed depending on the type of node
  var serverFunctionsImpl = StorageFunctions(locator(), urlPath: 'storage');
  locator.registerLazySingleton<StorageFunctions>(() => serverFunctionsImpl);

  var serverStats = ServerStats(storage: locator());
  locator.registerLazySingleton(() => serverStats);
}
