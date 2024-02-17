// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabowsla_cloud/core/app_streams.dart';
import 'package:sabowsla_cloud/features/auth/models/delete_user_result.dart';
import 'package:sabowsla_cloud/features/auth/models/register_result_model.dart';
import 'package:sabowsla_cloud/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_cloud/features/auth/presentation/modals/create_user_modal_widget.dart';
import 'package:sabowsla_cloud/features/auth/source/auth_data_source.dart';

var authController = AuthController();

class AuthController {
  var filePicker = FilePicker.platform;
  var displayedUsers = BehaviorSubject<List<UserCredential>>.seeded([]);
  var totalUsers = BehaviorSubject<int>.seeded(0);
  var currentTab = BehaviorSubject<Enum>.seeded(AuthViewTab.Users);
  var loading = BehaviorSubject<bool>.seeded(false);

  void loadAllUsers() async {
    loading.add(true);
    DateTime start = DateTime.now();
    appStreams.loadingIndicator.add(true);
    var users = await authDataSource.getAllUsers();
    displayedUsers.add(users);
    appStreams.loadingIndicator.add(false);
    DateTime end = DateTime.now();
    loading.add(false);
    print("users loaded ${users.length} duration ${end.difference(start)}");
  }

  void loadRecentUsers() async {
    DateTime start = DateTime.now();
    appStreams.loadingIndicator.add(true);
    var users = await authDataSource.getAllUsers();
    displayedUsers.add(users);
    appStreams.loadingIndicator.add(false);
    DateTime end = DateTime.now();
    print("users loaded ${users.length} duration ${end.difference(start)}");
  }

  void createUserModal(BuildContext context) async {
    await showModal(context, const CreateUserModalWidget());
  }

  void deleteUser(String uid) async {
    DeleteUserResult result = await authDataSource.deleteUser(uid);
    if (result.deleted) {
      var list = displayedUsers.value;
      list.removeWhere((element) => element.uid == uid);
      displayedUsers.add(list);
    } else {
      print('Error deleting user $uid');
    }
  }

  void userSettingsModal(BuildContext context, UserCredential user) async {
    await showModal(context, const CreateUserModalWidget());
  }

  Future showModal(BuildContext c, Widget widget) {
    return showDialog(
      context: c,
      builder: (context) {
        return widget;
      },
    );
  }

  Future<RegisterResult> createUser(UserCredential user) async {
    var result = await authDataSource.register(user.asRegisterRequest());
    if (result.error == null) {
      var list = [user, ...displayedUsers.value];
      displayedUsers.add(list);
    }
    return result;
  }

  Future<Uint8List> generateThumbnail(String path, Uint8List bytes) async {
    ImageFile input = ImageFile(filePath: path, rawBytes: bytes);
    Configuration config = const Configuration(
      // set quality between 0-100
      quality: 40,
    );

    final param = ImageFileConfiguration(input: input, config: config);
    var imageFile = await compressor.compress(param);
    return imageFile.rawBytes;
  }

  Future<String?> pickImageThumbnail() async {
    try {
      var fr = await filePicker.pickFiles(type: FileType.image);
      File file = File(fr!.files.firstOrNull!.path!);
      var bytes = file.readAsBytesSync();
      var cI = await generateThumbnail(file.path, bytes);
      return base64Encode(cI);
    } catch (e) {
      print('Error picking thumbnail: $e');
      return null;
    }
  }
}
