import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_controller.dart';
import 'package:sabowsla_cloud/features/auth/presentation/users_page_view/users_page_view_users_list.dart';

class UsersPageView extends ConsumerStatefulWidget {
  const UsersPageView({super.key});

  @override
  ConsumerState<UsersPageView> createState() => _UsersPageViewState();
}

class _UsersPageViewState extends ConsumerState<UsersPageView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      ref.read(authPageControllerProvider.notifier).loadRecentUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const UsersPageViewUsersList();
  }
}
