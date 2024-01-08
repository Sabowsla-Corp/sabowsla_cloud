// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabowsla_server/features/auth/models/register_result_model.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_server/features/auth/presentation/modals/create_user_modal_widget.dart';
import 'package:sabowsla_server/features/database/data_base_data_source.dart';

var authController = AuthController();

class AuthController {
  var filePicker = FilePicker.platform;
  var displayedUsers = BehaviorSubject<List<UserCredential>>.seeded([]);
  var currentTab = BehaviorSubject<Enum>.seeded(AuthViewTab.Users);

  void loadRecentUsers() async {
    var users = await dataBaseDataSource.getUsers(offset: 0);
    displayedUsers.add(users);
    print("users loaded ${users.length}");
  }

  void createUserModal(BuildContext context) async {
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
    var result = await dataBaseDataSource.registerUser(user);
    if (result.error == null) {
      var list = [user, ...displayedUsers.value];
      displayedUsers.add(list);
      print("user created successfully new list has ${list.length}");
    } else {
      print('Error creating user: ${result.error}');
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
