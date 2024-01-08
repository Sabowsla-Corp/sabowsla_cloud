import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_compression_flutter/flutter_image_compress.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabowsla_server/features/auth/models/user_credential_model.dart';
import 'package:sabowsla_server/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_server/features/auth/presentation/modals/create_user_modal_widget.dart';
import 'package:sabowsla_server/features/database/data_base_data_source.dart';

var authController = AuthController();

class AuthController {
  var filePicker = FilePicker.platform;
  var displayedUsers = BehaviorSubject<List<UserCredential>>.seeded([]);
  var currentTab = BehaviorSubject<Enum>.seeded(AuthViewTab.Users);

  Future<void> loadRecentUsers() async {
    var users = await dataBaseDataSource.getUsers(offset: 0);
    displayedUsers.add(users);
  }

  Future<void> createUserModal(BuildContext context) async {
    await showModal(context, const CreateUserModalWidget());
  }

  Future showModal(BuildContext c, Widget widget) {
    return showModalBottomSheet(
      context: c,
      builder: (context) {
        return widget;
      },
    );
  }

  Future<Uint8List> generateThumbnail(Uint8List bytes) async {
    return await FlutterImageCompress.compressWithList(
      bytes,
      minHeight: 512,
      minWidth: 512,
      quality: 50,
    );
  }

  Future<String?> pickImageThumbnail() async {
    try {
      var fr = await filePicker.pickFiles(type: FileType.image);
      File file = File(fr!.files.firstOrNull!.path!);
      var bytes = file.readAsBytesSync();
      var cI = await generateThumbnail(bytes);
      return base64Encode(cI);
    } catch (e) {
      print('Error picking thumbnail: $e');
      return null;
    }
  }
}
