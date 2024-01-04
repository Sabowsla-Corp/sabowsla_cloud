enum LoopState { none, replay, replayOne }

enum InitResult { incomplete, complete, cloudError }

enum PlayFormat { video, audio }

enum HarmonieType { all, sleep, relax, live }

enum SearchTabs { all, experiences, meditations, discoveries, playlists }

enum ProductId { month, year, test }

enum UserResponse {
  userExists,
  networkError,
  invalidToken,
  unknownError,
  success
}

enum SessionResponse { success, invalidCode, noInternet }

enum HomeRoute { home, search, meditations, sleep, playlists }

enum DiscoveryFilter { sleep, wakeUp, activate, relax }

enum UpdatePasswordResponse {
  success,
  weakPassword,
  noInternet,
  error,
  wrongPassword
}
