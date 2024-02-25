import 'package:sabowsla_cloud/features/projects/models/project_model.dart';

class ProjectsState {
  ProjectsState({this.projects = const [], this.selectedProject});

  final List<ProjectModel> projects;
  final ProjectModel? selectedProject;
}
