import 'dart:developer';
import 'dart:io';

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
    try {
      //Users Database, Single Instance
      var authDirectory = project.authDirectory;
      var name = "auth";
      var authIsarDb =
          await openIsar([UserCredentialSchema], authDirectory, name);
      //Project Databases
      //Eeach project may contain multiple databases, each with its own schema and directory
      //An example would be posts collection, reposts collection, comments collection, etc

      copyState(
        isarInstances: [
          authIsarDb,
        ],
      );
    } catch (e) {
      log("Problem Initializing Project$e");
    }
  }

  Future<Isar> openIsar(
    List<CollectionSchema<dynamic>> schemas,
    String directory,
    String name,
  ) async {
    try {
      await ensureIsarDirectory(directory);

      return await Isar.open(
        schemas,
        directory: directory,
        name: name,
      );
    } catch (e) {
      if (e is IsarError) {
        log("Isar Error ${e.message}");
      }
      log("Problem Opening Isar database at $directory with name $name $e");
      rethrow;
    }
  }

  Future<void> ensureIsarDirectory(String directory) async {
    try {
      bool directoryExists = await Directory(directory).exists();
      if (!directoryExists) {
        var dir = await Directory(directory).create(recursive: true);
        bool dirExists = await dir.exists();
        if (dirExists == false) {
          throw Exception("Could not create directory at $directory");
        }
      }
    } catch (e) {
      log("Problem Creating Directory for Isar $e");
      rethrow;
    }
  }
}
