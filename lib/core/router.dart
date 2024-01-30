import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_cloud/features/home/home_page.dart';

var navigationService = NavigationService();

class NavigationService {
  var goRouterProvider = Provider<GoRouter>((ref) {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return const DashboardPage();
          },
        ),
      ],
    );
  });
}
