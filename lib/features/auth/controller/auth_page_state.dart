import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';

class AuthPageState {
  AuthPageState({
    this.displayedUsers = const [],
    this.loading = false,
    this.totalUsers = 0,
    this.currentTab = AuthViewTab.Users,
  });

  final UserCredentials displayedUsers;
  final bool loading;
  final AuthViewTab currentTab;
  final int totalUsers;

  AuthPageState copyWith({
    UserCredentials? displayedUsers,
    bool? loading,
    AuthViewTab? currentTab,
    int? totalUsers,
  }) {
    return AuthPageState(
      displayedUsers: displayedUsers ?? this.displayedUsers,
      loading: loading ?? this.loading,
      currentTab: currentTab ?? this.currentTab,
      totalUsers: totalUsers ?? this.totalUsers,
    );
  }
}
