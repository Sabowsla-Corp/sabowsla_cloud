// ignore_for_file: avoid_classes_with_only_static_members

class KeyConstants {
  static String tvCode = 'last_connected_tv_code';
  static String sessionsLocalKey = 'sessions_local_key';
  static String codeSent = 'code-sent';
  static String firstTime = 'first_time_in_app';
  static String gifLod = 'gif_lods';
  static String connectedDeviceHistory = "connectedDeviceHistory";
  static String forYourKidsDocId = "Q6lokjA2OsUbkWlxaODV";
  static String showClockIntro = "showClockIntro";
  static String scheduleSet = "scheduleSet";
  static String recentSearchesKey = 'recent_searches_database';
  static String playbackSurveyDateKey = 'surveyDateKey';
  static String onboardingCompletedKey = 'onboardingCompletedKey';
  static String onboardingPreferencesKey = 'onboardingPreferencesKey';
  static String recentlyPlayedMeditations = 'recentlyPlayedMeditations';
}

class WhoopApi {
  static String get sleepEndpoint => "${whoopApi}activity/sleep/";
  static String whoopApi = 'https://api.prod.whoop.com/developer/v1/';
  static String get recoveryEndpoint => "${whoopApi}recovery";
  static String tokenUrl = 'https://api.prod.whoop.com/oauth/oauth2/token';
  static String authUrl = 'https://api.prod.whoop.com/oauth/oauth2/auth';
  static String responseType = 'response_type=code';
  static String scopes = 'scope=read:sleep%20read:recovery';
  static String whoopClientSecret =
      '0882ece4de57a0d5b214fae256df37eb7bd6f5723072a88184183177205d8c25';
  static String whoopClientId = 'f9526c6d-f0d2-45cf-96c5-e8f17d530b04';
  static String whoopRedirectUrl = 'https://harmonie.life/intro';
}
