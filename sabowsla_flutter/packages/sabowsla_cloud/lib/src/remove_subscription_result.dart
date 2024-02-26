import 'package:sabowsla/src/sabowsla_realtime_error.dart';

class RemoveSubscriptionResult {
  const RemoveSubscriptionResult({required this.openSubscriptions, this.error});
  final int openSubscriptions;
  final SabowslaRealtimeError? error;

  @override
  String toString() =>
      'RemoveSubscriptionResult(openSubscriptions: $openSubscriptions, error: $error)';
}
