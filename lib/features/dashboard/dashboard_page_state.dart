import 'package:isar/isar.dart';

class DashboardPageState {
  DashboardPageState({
    required this.loading,
    required this.isarInstances,
  });

  final bool loading;
  final List<Isar> isarInstances;
}
