//Singleton class to handle all the information about what projects there are and where they are located

import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabowsla_cloud/core/constants/export_ui_tools.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/features/projects/models/project_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

var projectsDataSourceProvider = Provider<ProjectsDataSource>(
  (ref) => throw UnimplementedError(),
);

Isar? _isarDb;
SharedPreferences? _prefs;

class ProjectsDataSource {
  ProjectsDataSource({String? isarPath}) {
    _init(isarPath);
  }
  bool initing = false;

  void _init(String? isarPath) async {
    try {
      initing = true;

      if (_isarDb?.isOpen == true) {
        bool? closed = await _isarDb?.close();
        if (closed == false) {
          throw Exception("Failed to close isar db");
        }
      }

      String dir =
          isarPath ?? "${(await getApplicationDocumentsDirectory()).path}/";
      Directory dirExists = Directory(dir);
      if (!dirExists.existsSync()) {
        log("Creating directory for isar at $dir");
        await dirExists.create();
      }
      _isarDb = await Isar.open(
        [ProjectModelSchema],
        directory: dir,
        name: 'sabowsla_cloud_projects.db',
      );
      log("opened isar instance at dir $dir");

      _prefs = await SharedPreferences.getInstance();

      initing = false;
    } catch (e) {
      log("Error Initializing Projects Data Source: $e");
    }
  }

  void setDefaultProject(ProjectModel? model) {
    while (initing) {
      Future.delayed(const Duration(milliseconds: 100));
      print('Waiting for isar to init');
    }
    if (model == null) {
      _prefs?.remove("default_project");
    } else {
      _prefs?.setInt("default_project", model.id);
    }
  }

  Future<ProjectModel?> getDefaultProject() async {
    while (initing) {
      await Future.delayed(const Duration(milliseconds: 100));
      print('Waiting for isar to init');
    }
    int? id = _prefs?.getInt("default_project");
    if (id == null) {
      return null;
    }
    return _isarDb?.projectModels.where().idEqualTo(id).findFirst();
  }

  Future<CreateSabowslaProjectResult> createNewProject({
    required ProjectModel project,
  }) async {
    try {
      while (initing) {
        await Future.delayed(const Duration(milliseconds: 100));
        print('Waiting for isar to init');
      }

      var db = _isarDb!;
      //Whether this location is already used for another projects db, however we will check if the actual folder exists
      await validProjectSettings(project);
      int id = 0;
      //Create directory at basePath
      var dir = await Directory(project.basePath).create(recursive: true);
      log("Directory created at ${dir.path} for project name ${project.name} with id $id");
      await db.writeTxn(() async {
        id = await db.projectModels.put(project);
      });
      if (id == 0) {
        return CreateSabowslaProjectResult.unknownError;
      }
      return CreateSabowslaProjectResult.success;
    } catch (e) {
      log("Error creating project: $e");

      if (e is CreateSabowslaProjectResult) {
        return e;
      }
      return CreateSabowslaProjectResult.unknownError;
    }
  }

  Future validProjectSettings(ProjectModel project) async {
    if (project.name.isEmpty) {
      throw CreateSabowslaProjectResult.invalidName;
    }
    if (project.basePath.isEmpty) {
      throw CreateSabowslaProjectResult.invalidPath;
    }
    ProjectModel? projectPathExists = _isarDb!.projectModels
        .where()
        .basePathEqualTo(project.basePath)
        .findFirstSync();
    var folderOfProjectPathExists = await Directory(project.basePath).exists();

    if (projectPathExists != null && folderOfProjectPathExists) {
      throw CreateSabowslaProjectResult.locationUsed;
    }
  }

  Future<ProjectModels> getAllProjects() async {
    while (initing) {
      await Future.delayed(const Duration(milliseconds: 100));
      print('Waiting for isar to init');
    }
    var db = _isarDb!;
    return db.projectModels.where().anyId().build().findAll();
  }

  Future<(CreateSabowslaProjectResult, ProjectModel)>
      createNewProjectFromSettings({
    required String name,
    required String basePath,
    required String uid,
  }) async {
    var project = ProjectModel(
      name: name,
      basePath: basePath,
      uid: uid,
      createdAt: DateTime.now(),
    );
    var result = await createNewProject(project: project);
    return (result, project);
  }
}

enum CreateSabowslaProjectResult {
  invalidName,
  invalidPath,
  locationUsed,
  invalidPermissions,
  notEnoughSpace,
  unknownError,
  success,
}
