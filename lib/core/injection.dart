import 'package:get_it/get_it.dart';
import 'package:sabowsla_server/core/server_funtions.dart';
import 'package:sabowsla_server/core/server_funtions_impl.dart';

var locator = GetIt.instance;

Future<void> injectDependencies() async {
  var serverFunctionsImpl = ServerFunctionsImpl();
  locator.registerLazySingleton<ServerFunctions>(() => serverFunctionsImpl);
}
