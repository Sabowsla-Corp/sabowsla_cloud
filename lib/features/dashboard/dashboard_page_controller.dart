import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_cloud/features/dashboard/dashboard_page_state.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:sabowsla_cloud/features/projects/projects_page_controller.dart';

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
    copyState(loading: true);
    var project = ref.read(projectsPageControllerProvider).selectedProject;
    if (project != null) {
      await initializeProject(project);
    }
    copyState(loading: false);
  }

  Future<void> initializeProject(ProjectModel project) async {
    //Users Database, Single Instance
    var authDirectory = project.authDirectory;
    var authIsarDb = await openIsar([UserCredentialSchema], authDirectory);
    //Project Databases
    //Eeach project may contain multiple databases, each with its own schema and directory
    //An example would be posts collection, reposts collection, comments collection, etc
    var projectIsarDbs = await Future.wait(
      project.databaseSchemas.map((e) => openIsar(e.$2, e.$1.path)),
    );

    copyState(
      isarInstances: [
        authIsarDb,
        ...projectIsarDbs,
      ],
    );
  }

  Future<Isar> openIsar(
    List<CollectionSchema<dynamic>> schemas,
    String directory,
  ) {
    return Isar.open(schemas, directory: directory);
  }
}
