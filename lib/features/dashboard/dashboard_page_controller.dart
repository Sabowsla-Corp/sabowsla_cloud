import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page_state.dart';

part 'dashboard_page_controller.g.dart';

var _innerState = DashboardPageState(
  loading: true,
  isarInstances: [],
);

@riverpod
class DashboardPageController extends _$DashboardPageController {
  @override
  DashboardPageState build() => _innerState;

  void copyState({
    bool? loading,
    List<Isar>? isarInstances,
  }) {
    _innerState = DashboardPageState(
      loading: loading ?? _innerState.loading,
      isarInstances: isarInstances ?? _innerState.isarInstances,
    );
    state = _innerState;
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    copyState(
      loading: false,
      isarInstances: [],
    );
  }
}
