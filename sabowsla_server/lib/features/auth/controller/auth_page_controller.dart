// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabowsla_cloud/core/app_streams.dart';
import 'package:sabowsla_cloud/features/auth/controller/auth_page_state.dart';
import 'package:sabowsla_cloud/features/auth/presentation/auth_view_tabs.dart';
import 'package:sabowsla_cloud/features/auth/source/auth_data_source.dart';
import 'package:sabowsla_core/sabowsla_core.dart';

part 'auth_page_controller.g.dart';

@riverpod
class AuthPageController extends _$AuthPageController {
  @override
  AuthPageState build() => AuthPageState();

  void setLoading() => state = state.copyWith(loading: true);
  void removeLoading() => state = state.copyWith(loading: false);
  void setUsers(List<UserCredential> users) =>
      state = state.copyWith(displayedUsers: users);

  AuthDataSource get authDataSource => ref.read(authDataSourceProvider);

  void loadAllUsers() async {
    setLoading();
    DateTime start = DateTime.now();
    appStreams.loadingIndicator.add(true);
    var users = await authDataSource.getAllUsers();
    setUsers(users);
    appStreams.loadingIndicator.add(false);
    DateTime end = DateTime.now();
    removeLoading();
    print("users loaded ${users.length} duration ${end.difference(start)}");
  }

  void loadRecentUsers() async {
    DateTime start = DateTime.now();
    appStreams.loadingIndicator.add(true);
    var users = await authDataSource.getAllUsers();
    setUsers(users);
    appStreams.loadingIndicator.add(false);
    DateTime end = DateTime.now();
    print("users loaded ${users.length} duration ${end.difference(start)}");
  }

  void deleteUser(String uid) async {
    DeleteUserResult result = await authDataSource.deleteUser(uid);
    if (result.deleted) {
      var list = state.displayedUsers;
      list.removeWhere((element) => element.uid == uid);
      setUsers(list);
    } else {
      print('Error deleting user $uid');
    }
  }

  Future<RegisterResult> createUser(UserCredential user) async {
    var result = await authDataSource.register(user.asRegisterRequest());
    if (result.error == null) {
      var list = [user, ...state.displayedUsers];
      setUsers(list);
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
      var fr = await FilePicker.platform.pickFiles(type: FileType.image);
      File file = File(fr!.files.firstOrNull!.path!);
      var bytes = file.readAsBytesSync();
      var cI = await generateThumbnail(file.path, bytes);
      return base64Encode(cI);
    } catch (e) {
      print('Error picking thumbnail: $e');
      return null;
    }
  }

  void setCurrentTab(AuthViewTab e) {
    state = state.copyWith(currentTab: e);
  }
}
