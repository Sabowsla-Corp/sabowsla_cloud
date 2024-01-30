import 'package:sabowsla_cloud/features/home/models/sabowsla_project_model.dart';

class HomePageState {
  HomePageState({
    this.projects = const [],
  });

  final List<SabowslaProjectModel> projects;

  HomePageState copyWith({
    List<SabowslaProjectModel>? projects,
  }) {
    return HomePageState(
      projects: projects ?? this.projects,
    );
  }
}
