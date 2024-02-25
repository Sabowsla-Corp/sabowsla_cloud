import 'dart:developer';

final logger = CustomLogger();

class CustomLogger {
  void t(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    log(message, time: time, error: error, stackTrace: stackTrace, level: 1);
  }

  void d(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    log(message, time: time, error: error, stackTrace: stackTrace, level: 2);
  }

  void i(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    log(message, time: time, error: error, stackTrace: stackTrace, level: 3);
  }

  void w(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    log(message, time: time, error: error, stackTrace: stackTrace, level: 4);
  }

  void e(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    log(message, time: time, error: error, stackTrace: stackTrace, level: 5);
  }
}
