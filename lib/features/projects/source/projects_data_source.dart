//Singleton class to handle all the information about what projects there are and where they are located

import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sabowsla_cloud/core/constants/type_def.dart';
import 'package:sabowsla_cloud/core/extensions/nullable_extensions.dart';
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
      log("Initializing isar db");
      if (_isarDb?.isOpen == true) {
        bool? closed = await _isarDb?.close();
        if (closed == false) {
          throw Exception("Failed to close isar db");
        }
      }
      String dir = isarPath ?? (await getApplicationDocumentsDirectory()).path;
      _isarDb = await Isar.open(
        [ProjectModelSchema],
        directory: dir,
      );
      _prefs = await SharedPreferences.getInstance();
      log("Database inited");
      initing = false;
    } catch (e) {
      log("Error initializing isar db: $e");
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
      if (project.name.isEmpty) {
        return CreateSabowslaProjectResult.invalidName;
      }
      if (project.basePath.isEmpty) {
        return CreateSabowslaProjectResult.invalidPath;
      }
      var db = _isarDb!;
      //Whether this location is already used for another projects db, however we will check if the actual folder exists
      var projectPathExists = db.projectModels
          .where()
          .basePathEqualTo(project.basePath)
          .findFirstSync();
      var folderOfProjectPathExists = await File(project.basePath).exists();
      if (projectPathExists?.isNotNull == true && folderOfProjectPathExists) {
        log("Location already used, locationg is ${project.basePath}");
        return CreateSabowslaProjectResult.locationUsed;
      }
      int id = 0;
      //Create directory at basePath
      await Directory(project.basePath).create();
      await db.writeTxn(() async {
        id = await db.projectModels.put(project);
      });
      log("Project reference on isar created $id");

      if (id == 0) {
        log("Error creating project beacuse id is 0");
        return CreateSabowslaProjectResult.unknownError;
      }
      return CreateSabowslaProjectResult.success;
    } catch (e) {
      log("Error creating project: $e");
      return CreateSabowslaProjectResult.unknownError;
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

  Future<CreateSabowslaProjectResult> createNewProjectFromSettings({
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
    return await createNewProject(project: project);
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
