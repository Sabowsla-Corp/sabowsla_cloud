import 'package:equatable/equatable.dart';
import 'package:sabowsla_server/core/server_function.dart';

abstract class ServerFunctions extends Equatable {
  Future<void> saveFile();
  Future<void> updateFile();

  @override
  List<ServerFunction> get props;
}
