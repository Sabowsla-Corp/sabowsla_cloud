import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/core/router.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/source/projects_data_source.dart';
import 'package:sabowsla_cloud/features/projects/views/create_project_view.dart';

part 'projects_page_controller.g.dart';

List<ProjectModel> _projects = [];

@riverpod
class ProjectsController extends _$ProjectsController {
  @override
  ProjectsState build() => ProjectsState(projects: _projects);
  ProjectsDataSource get source => ref.read(projectsDataSourceProvider);

  void loadProjects() async {
    var ps = await source.getAllProjects();
    state = state.copyWith(projects: ps);
    print("loaded projects: ${ps.length}");
    _projects = ps;
  }

  Future<void> createNewProjectFromSettings({
    required String name,
    required String basePath,
    required String uid,
  }) async {
    CreateSabowslaProjectResult result =
        await source.createNewProjectFromSettings(
      name: name,
      basePath: basePath,
      uid: uid,
    );
    showProjectCreationResultToast(result);
  }

  void showProjectCreationResultToast(CreateSabowslaProjectResult result) {
    switch (result) {
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

  void toCreateProjectsPage() {
    CreateProjectView.open(ref);
  }
}

class ProjectsState {
  ProjectsState({this.projects = const []});

  final List<ProjectModel> projects;

  ProjectsState copyWith({
    List<ProjectModel>? projects,
  }) {
    return ProjectsState(
      projects: projects ?? this.projects,
    );
  }
}