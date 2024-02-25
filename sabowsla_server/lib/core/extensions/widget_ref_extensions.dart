import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

extension WidgetRefExtensions on WidgetRef {
  GoRouter get router => read(navigationService.goRouterProvider);

  void openProject(ProjectModel project) {
    read(projectsPageControllerProvider.notifier).openProject(project);
  }
}

extension AutoDisponseNotifierExtensions on AutoDisposeNotifierProviderRef {
  GoRouter get router => read(navigationService.goRouterProvider);
}
