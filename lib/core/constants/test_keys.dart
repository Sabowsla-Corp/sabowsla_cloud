// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class TestKeys {
  static const Key gifsLoadedScreen = Key("gifs_loaded_screen_key");
  static const Key toLoginFormButton = Key('login_button');
  static const Key performLoginButton = Key('perform_login');
  static const Key startLoginPageButton = Key('start_login_page_button');
  static const Key emailLoginPage = Key('email_login_page');
  static const Key emailInput = Key('email_input');
  static const Key passwordInput = Key('password_input');
  static const Key skipLoginButton = Key('skip_loggin_button');
  static const Key homeUserIcon = Key('home_user_icon');
  static const Key playDiscoveryFromDetails =
      Key('play_discovery_from_details');
  static const Key playAsMusic = Key('play_as_music');
  static const Key playAsVideo = Key('play_as_video');
  static const Key closePlayBackPage = Key('close_playback_page');
  static const Key createPlaylistInputField = Key('createPlaylistInputField');
  static const Key createPlaylistButton = Key('createPlaylistButton');
  static const Key createPlaylistConfirmButton =
      Key('createPlaylistConfirmButton');
  static const Key homeMenu = Key('homeMenu');
  static const Key searchMenu = Key('searchMenu');
  static const Key meditationsMenu = Key('meditationsMenu');
  static const Key playlistsMenu = Key('playlistsMenu');
  static const Key sleepMenu = Key('sleepMenu');
  static const Key closeDiscoveryDetails = Key('closeDiscoveryDetails');
  static Key getUserPlaylistCardView(int index) =>
      Key('userPlaylistCardView$index');
  static const Key editPlaylistName = Key('editPlaylistName');

  static Key getDiscoveryHome(int index) => Key("discovery_home_circle_$index");
}
