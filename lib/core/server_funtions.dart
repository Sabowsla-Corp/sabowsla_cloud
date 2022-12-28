import 'package:equatable/equatable.dart';
import 'package:sabowsla_server/core/server_function.dart';

abstract class ServerFunctions extends Equatable {
  @override
  List<ServerFunction> get props;
}
