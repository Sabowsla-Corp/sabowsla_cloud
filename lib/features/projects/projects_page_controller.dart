import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/core/extensions/widget_ref_extensions.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_state.dart';
import 'package:sabowsla_cloud/features/projects/source/projects_data_source.dart';

part 'projects_page_controller.g.dart';

ProjectsState _innerState = ProjectsState(
  projects: [],
);

@riverpod
class ProjectsPageController extends _$ProjectsPageController {
  @override
  ProjectsState build() => _innerState;
  ProjectsDataSource get source => ref.read(projectsDataSourceProvider);

  void copyState({
    List<ProjectModel>? projects,
    ProjectModel? selectedProject,
  }) {
    state = ProjectsState(
      projects: projects ?? state.projects,
      selectedProject: selectedProject ?? state.selectedProject,
    );
  }

  void init() async {
    var ps = await source.getAllProjects();
    var defaultProject = await source.getDefaultProject();
    copyState(projects: ps, selectedProject: defaultProject);
    if (defaultProject != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      openProject(defaultProject);
    }
  }

  void openProject(ProjectModel project) {
    copyState(selectedProject: project);
    ref.router.push(DashboardPage.routeName);
    log("Opening project ${project.name}");
  }

  void closeProject() {
    state = ProjectsState(projects: state.projects);
  }

  Future<void> createNewProjectFromSettings({
    required String name,
    required String basePath,
    required String uid,
  }) async {
    var result = await source.createNewProjectFromSettings(
      name: name,
      basePath: basePath,
      uid: uid,
    );
    showProjectCreationResultToast(result);
  }

  void showProjectCreationResultToast(
    (CreateSabowslaProjectResult result, ProjectModel? projectModel) message,
  ) {
    switch (message.$1) {
      case CreateSabowslaProjectResult.invalidName:
        navigationService
            .showToast("El nombre del proyecto no puede estar vacío");
        break;
      case CreateSabowslaProjectResult.invalidPath:
        navigationService
            .showToast("La ubicación del proyecto no puede estar vacía");
        break;
      case CreateSabowslaProjectResult.locationUsed:
        navigationService.showToast("La ubicación del proyecto ya está en uso");
        break;
      case CreateSabowslaProjectResult.success:
        navigationService.showToast("Proyecto creado con éxito");
        //Open dashboard page

        ref
            .read(projectsPageControllerProvider.notifier)
            .copyState(selectedProject: message.$2);
        ref.router.goNamed(DashboardPage.routeName);
        break;
      case CreateSabowslaProjectResult.invalidPermissions:
        navigationService.showToast(
          "No tienes permisos para crear un proyecto en esa ubicación",
        );
        break;
      case CreateSabowslaProjectResult.notEnoughSpace:
        navigationService.showToast(
          "No hay suficiente espacio en la ubicación seleccionada",
        );
        break;
      case CreateSabowslaProjectResult.unknownError:
        navigationService.showToast(
          "Ocurrió un error desconocido al crear el proyecto",
        );
        break;
    }
  }
}

var openProjectProvider = Provider<ProjectModel?>((ref) {
  return ref.read(projectsPageControllerProvider).selectedProject;
});
