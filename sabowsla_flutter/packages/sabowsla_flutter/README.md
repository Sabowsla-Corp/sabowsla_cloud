# `sabowsla_flutter`

[![pub package](https://img.shields.io/pub/v/sabowsla_flutter.svg)](https://pub.dev/packages/sabowsla_flutter)
[![pub test](https://github.com/sabowsla/sabowsla-flutter/workflows/Test/badge.svg)](https://github.com/sabowsla/sabowsla-flutter/actions?query=workflow%3ATest)

---

Flutter Client library for [Sabowsla](https://sabowsla.com/).

- Documentation: https://sabowsla.com/docs/reference/dart/introduction

## Getting Started

Import the package:

```dart
import 'package:sabowsla_flutter/sabowsla_flutter.dart';
```

Initialize `Sabowsla` before using it:

```dart
import 'package:sabowsla_flutter/sabowsla_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Sabowsla.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  runApp(MyApp());
}

// It's handy to then extract the Sabowsla client in a variable for later uses
final sabowsla = Sabowsla.instance.client;
```

## Usage example

### [Authentication](https://sabowsla.com/docs/guides/auth)

```dart
final sabowsla = Sabowsla.instance.client;

// Email and password sign up
await sabowsla.auth.signUp(
  email: email,
  password: password,
);

// Email and password login
await sabowsla.auth.signInWithPassword(
  email: email,
  password: password,
);

// Magic link login
await sabowsla.auth.signInWithOtp(email: 'my_email@example.com');

// Listen to auth state changes
sabowsla.auth.onAuthStateChange.listen((data) {
  final AuthChangeEvent event = data.event;
  final Session? session = data.session;
  // Do something when there is an auth event
});
```

#### Native Apple Sign in

You can perform Apple sign in using the [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple) package on Flutter.
Follow the instructions on README of the `sign_in_with_apple` package to setup the native Apple sign in on iOS and macOS.

Once the setup is complete on the Flutter app, add the bundle ID of your app to your Sabowsla dashboard in `Authentication -> Providers -> Apple` in order to register your app with Sabowsla.

```dart
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sabowsla_flutter/sabowsla_flutter.dart';

/// Performs Apple sign in on iOS or macOS
Future<AuthResponse> signInWithApple() async {
  final rawNonce = sabowsla.auth.generateRawNonce();
  final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: hashedNonce,
  );

  final idToken = credential.identityToken;
  if (idToken == null) {
    throw const AuthException(
        'Could not find ID Token from generated credential.');
  }

  return signInWithIdToken(
    provider: OAuthProvider.apple,
    idToken: idToken,
    nonce: rawNonce,
  );
}
```

#### Native Google sign in

You can perform native Google sign in on Android and iOS using [google_sign_in](https://pub.dev/packages/google_sign_in).
For platform specific settings, follow the instructions on README of the package.

First, create client IDs for your app. You need to create a web client ID as well to perform Google sign-in with Sabowsla.

- [Steps to obtain web client ID](https://developers.google.com/identity/sign-in/android/start-integrating#configure_a_project)
- [Steps to obtain Android client ID](https://developers.google.com/identity/sign-in/android/start-integrating#configure_a_project)
- [Steps to obtain iOS client ID](https://developers.google.com/identity/sign-in/ios/start-integrating#get_an_oauth_client_id)

Once you have registered your app and created the client IDs, add the web client ID in your Sabowsla dashboard in `Authentication -> Providers -> Google`. Also turn on the `Skip nonce check` option, which will enable Google sign-in on iOS.

At this point you can perform native Google sign in using the following code. Be sure to replace the `webClientId` and `iosClientId` with your own.

```dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sabowsla_flutter/sabowsla_flutter.dart';

...

Future<AuthResponse> _googleSignIn() async {
  /// TODO: update the Web client ID with your own.
  ///
  /// Web Client ID that you registered with Google Cloud.
  const webClientId = 'my-web.apps.googleusercontent.com';

  /// TODO: update the iOS client ID with your own.
  ///
  /// iOS Client ID that you registered with Google Cloud.
  const iosClientId = 'my-ios.apps.googleusercontent.com';

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.

  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: iosClientId,
    serverClientId: webClientId,
  );
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  return sabowsla.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
}
...
```

### OAuth login

For providers other than Apple or Google, you need to use the `signInWithOAuth()` method to perform OAuth login. This will open the web browser to perform the OAuth login.

Use the `redirectTo` parameter to redirect the user to a deep link to bring the user back to the app. Learn more about setting up deep links in [Deep link config](#deep-link-config).

```dart
// Perform web based OAuth login
await sabowsla.auth.signInWithOAuth(
  OAuthProvider.github,
  redirectTo: kIsWeb ? null : 'io.sabowsla.flutter://callback',
);

// Listen to auth state changes in order to detect when ther OAuth login is complete.
sabowsla.auth.onAuthStateChange.listen((data) {
  final AuthChangeEvent event = data.event;
  if(event == AuthChangeEvent.signedIn) {
    // Do something when user sign in
  }
});
```

### [Database](https://sabowsla.com/docs/guides/database)

Database methods are used to perform basic CRUD operations using the Sabowsla REST API. Full list of supported operators can be found [here](https://sabowsla.com/docs/reference/dart/select).

```dart
// Select data with filters
final data = await sabowsla
  .from('cities')
  .select()
  .eq('country_id', 1) // equals filter
  .neq('name', 'The shire'); // does not equal filter

// Insert a new row
await sabowsla
  .from('cities')
  .insert({'name': 'The Shire', 'country_id': 554});
```

### [Realtime](https://sabowsla.com/docs/guides/realtime)

#### Realtime data as `Stream`

To receive realtime updates, you have to first enable Realtime on from your Sabowsla console. You can read more [here](https://sabowsla.com/docs/guides/api#realtime-api) on how to enable it.

> **Warning**
> When using `stream()` with a `StreamBuilder`, make sure to persist the stream value as a variable in a `StatefulWidget` instead of directly constructing the stream within your widget tree, which could cause rapid rebuilds that will lead to losing realtime connection.

```dart
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  // Persisting the future as local variable to prevent refetching upon rebuilds.
  final stream = sabowsla.from('countries').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        // return your widget with the data from snapshot
      },
    );
  }
}
```

#### [Postgres Changes](https://sabowsla.com/docs/guides/realtime#postgres-changes)

You can get notified whenever there is a change in your Sabowsla tables.

```dart
final myChannel = sabowsla.channel('my_channel');

myChannel
    .onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'countries',
      callback: (payload) {
        // Do something fun or interesting when there is an change on the database
      },
    )
    .subscribe();
```

#### [Broadcast](https://sabowsla.com/docs/guides/realtime#broadcast)

Broadcast lets you send and receive low latency messages between connected clients by bypassing the database.

```dart
final myChannel = sabowsla.channel('my_channel');

// Subscribe to `cursor-pos` broadcast event
final myChannel = sabowsla.channel('my_channel');

myChannel
    .onBroadcast(event: 'cursor-pos', callback: (payload) {}
        // Do something fun or interesting when there is an change on the database
        )
    .subscribe();

// Send a broadcast message to other connected clients
await myChannel.sendBroadcastMessage(
  event: 'cursor-pos',
  payload: {'x': 30, 'y': 50},
);
```

### [Presence](https://sabowsla.com/docs/guides/realtime#presence)

Presence let's you easily create "I'm online" feature.

```dart
final myChannel = sabowsla.channel('my_channel');

// Subscribe to presence events
myChannel
    .onPresence(
        event: PresenceEvent.sync,
        callback: (payload) {
          final onlineUsers = myChannel.presenceState();
          // handle sync event
        })
    .onPresence(
        event: PresenceEvent.join,
        callback: (payload) {
          // New users have joined
        })
    .onPresence(
        event: PresenceEvent.leave,
        callback: (payload) {
          // Users have left
        })
    .subscribe(((status, [_]) async {
  if (status == RealtimeSubscribeStatus.subscribed) {
    // Send the current user's state upon subscribing
    final status = await myChannel
        .track({'online_at': DateTime.now().toIso8601String()});
  }
}));
```

### [Storage](https://sabowsla.com/docs/guides/storage)

```dart
final file = File('example.txt');
file.writeAsStringSync('File content');
await sabowsla.storage
  .from('my_bucket')
  .upload('my/path/to/files/example.txt', file);

// Use the `uploadBinary` method to upload files on Flutter web
await sabowsla.storage
  .from('my_bucket')
  .uploadBinary('my/path/to/files/example.txt', file.readAsBytesSync());
```

### [Edge Functions](https://sabowsla.com/docs/guides/functions)

```dart
final data = await sabowsla.functions.invoke('get_countries');
```

## Deep links

### Why do you need to setup deep links

You need to setup deep links if you want your native app to open when a user clicks on a link. User clicking on a link and the app opens up happens in a few scenarios when you use Sabowsla auth, and in order to support those scenarios, you need to setup deep links.

### When do you need to setup deep links

- Magic link login
- Have `confirm email` enabled and are using email login
- Resetting password for email login
- Calling `.signInWithOAuth()` method

\*Currently sabowsla_flutter supports deep links on Android, iOS, Web, MacOS and Windows.

### Dashboard Deep link config

- Go to your Sabowsla project Authentication Settings page.
- You need to enter your app redirect callback on `Additional Redirect URLs` field.

The redirect callback url should have this format `[YOUR_SCHEME]://[YOUR_HOSTNAME]`. Here, `io.sabowsla.flutterdemo://login-callback` is just an example, you can choose whatever you would like for `YOUR_SCHEME` and `YOUR_HOSTNAME` as long as the scheme is unique across the user's device. For this reason, typically a reverse domain of your website is used.

![authentication settings page](https://raw.githubusercontent.com/sabowsla/sabowsla-flutter/main/.github/images/deeplink-config.png)

### Flutter Deep link config

sabowsla_flutter uses [app_link](https://pub.dev/packages/app_links) internally to handle deep links. You can find the platform specific config to setup deep links in the following.

https://github.com/llfbandit/app_links/tree/master?tab=readme-ov-file#getting-started

### Platform specific config

Follow the guide to find additional platform specidic condigs for your OAuth provider.

https://sabowsla.io/docs/guides/auth#third-party-logins

## Custom LocalStorage

As default, `sabowsla_flutter` uses [`Shared preferences`](https://pub.dev/packages/shared_preferences) to persist the user session.

However, you can use any other methods by creating a `LocalStorage` implementation. For example, we can use [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage) plugin to store the user session in a secure storage.

```dart
// Define the custom LocalStorage implementation
class MySecureStorage extends LocalStorage {

  final storage = FlutterSecureStorage();

  @override
  Future<void> initialize() async {}

  @override
  Future<String?> accessToken() async {
    return storage.containsKey(key: sabowslaPersistSessionKey);
  }

  @override
  Future<bool> hasAccessToken() async {
    return storage.read(key: sabowslaPersistSessionKey);
  }

  @override
  Future<void> persistSession(String persistSessionString) async {
    return storage.write(key: sabowslaPersistSessionKey, value: persistSessionString);
  }

  @override
  Future<void> removePersistedSession() async {
    return storage.delete(key: sabowslaPersistSessionKey);
  }
}

// use it when initializing
Sabowsla.initialize(
  ...
  authOptions: FlutterAuthClientOptions(
    localStorage: MySecureStorage(),
  ),
);
```

You can also use `EmptyLocalStorage` to disable session persistence:

```dart
Sabowsla.initialize(
  // ...
  authOptions: FlutterAuthClientOptions(
    localStorage: const EmptyLocalStorage(),
  ),
);
```

### Persisting the user session from sabowsla_flutter v1

sabowsla_flutter v1 used hive to persist the user session. In the current version of sabowsla_flutter it uses shared_preferences. If you are updating your app from v1 to v2, you can use the following custom `LocalStorage` implementation to automatically migrate the user session from [hive](https://pub.dev/packages/hive) to [shared_preferences](https://pub.dev/packages/shared_preferences).

```dart
const _hiveBoxName = 'sabowsla_authentication';

class MigrationLocalStorage extends LocalStorage {
  final SharedPreferencesLocalStorage sharedPreferencesLocalStorage;
  late final HiveLocalStorage hiveLocalStorage;

  MigrationLocalStorage({required String persistSessionKey})
      : sharedPreferencesLocalStorage =
            SharedPreferencesLocalStorage(persistSessionKey: persistSessionKey);

  @override
  Future<void> initialize() async {
    await Hive.initFlutter('auth');
    hiveLocalStorage = const HiveLocalStorage();
    await sharedPreferencesLocalStorage.initialize();
    try {
      await migrate();
    } on TimeoutException {
      // Ignore TimeoutException thrown by Hive methods
      // https://github.com/sabowsla/sabowsla-flutter/issues/794
    }
  }

  @visibleForTesting
  Future<void> migrate() async {
    // Migrate from Hive to SharedPreferences
    if (await Hive.boxExists(_hiveBoxName)) {
      await hiveLocalStorage.initialize();

      final hasHive = await hiveLocalStorage.hasAccessToken();
      if (hasHive) {
        final accessToken = await hiveLocalStorage.accessToken();
        final session =
            Session.fromJson(jsonDecode(accessToken!)['currentSession']);
        if (session == null) {
          return;
        }
        await sharedPreferencesLocalStorage
            .persistSession(jsonEncode(session.toJson()));
        await hiveLocalStorage.removePersistedSession();
      }
      if (Hive.box(_hiveBoxName).isEmpty) {
        final boxPath = Hive.box(_hiveBoxName).path;
        await Hive.deleteBoxFromDisk(_hiveBoxName);

        //Delete `auth` folder if it's empty
        if (!kIsWeb && boxPath != null) {
          final boxDir = File(boxPath).parent;
          final dirIsEmpty = await boxDir.list().length == 0;
          if (dirIsEmpty) {
            await boxDir.delete();
          }
        }
      }
    }
  }

  @override
  Future<String?> accessToken() {
    return sharedPreferencesLocalStorage.accessToken();
  }

  @override
  Future<bool> hasAccessToken() {
    return sharedPreferencesLocalStorage.hasAccessToken();
  }

  @override
  Future<void> persistSession(String persistSessionString) {
    return sharedPreferencesLocalStorage.persistSession(persistSessionString);
  }

  @override
  Future<void> removePersistedSession() {
    return sharedPreferencesLocalStorage.removePersistedSession();
  }
}

/// A [LocalStorage] implementation that implements Hive as the
/// storage method.
class HiveLocalStorage extends LocalStorage {
  /// Creates a LocalStorage instance that implements the Hive Database
  const HiveLocalStorage();

  /// The encryption key used by Hive. If null, the box is not encrypted
  ///
  /// This value should not be redefined in runtime, otherwise the user may
  /// not be fetched correctly
  ///
  /// See also:
  ///
  ///   * <https://docs.hivedb.dev/#/advanced/encrypted_box?id=encrypted-box>
  static String? encryptionKey;

  @override
  Future<void> initialize() async {
    HiveCipher? encryptionCipher;
    if (encryptionKey != null) {
      encryptionCipher = HiveAesCipher(base64Url.decode(encryptionKey!));
    }
    await Hive.initFlutter('auth');
    await Hive.openBox(_hiveBoxName, encryptionCipher: encryptionCipher)
        .timeout(const Duration(seconds: 1));
  }

  @override
  Future<bool> hasAccessToken() {
    return Future.value(
      Hive.box(_hiveBoxName).containsKey(
        sabowslaPersistSessionKey,
      ),
    );
  }

  @override
  Future<String?> accessToken() {
    return Future.value(
      Hive.box(_hiveBoxName).get(sabowslaPersistSessionKey) as String?,
    );
  }

  @override
  Future<void> removePersistedSession() {
    return Hive.box(_hiveBoxName).delete(sabowslaPersistSessionKey);
  }

  @override
  Future<void> persistSession(String persistSessionString) {
    // Flush after X amount of writes
    return Hive.box(_hiveBoxName)
        .put(sabowslaPersistSessionKey, persistSessionString);
  }
}
```

You can then initialize Sabowsla with `MigrationLocalStorage` and it will automatically migrate the session from Hive to SharedPreferences.

```dart
Sabowsla.initialize(
  // ...
  authOptions: FlutterAuthClientOptions(
    localStorage: const MigrationLocalStorage(
      persistSessionKey:
              "sb-${Uri.parse(url).host.split(".").first}-auth-token",
    ),
  ),
);
```

---

## Migrating Guide

You can find the migration guide to migrate from v1 to v2 here:
https://sabowsla.com/docs/reference/dart/upgrade-guide

## Contributing

- Fork the repo on [GitHub](https://github.com/sabowsla/sabowsla-flutter)
- Clone the project to your own machine
- Commit changes to your own branch
- Push your work back up to your fork
- Submit a Pull request so that we can review your changes and merge

## License

This repo is licenced under MIT.

## Resources

- [Quickstart: Flutter](https://sabowsla.com/docs/guides/with-flutter)
- [Flutter Tutorial: building a Flutter chat app](https://sabowsla.com/blog/flutter-tutorial-building-a-chat-app)
- [Flutter Tutorial - Part 2: Authentication and Authorization with RLS](https://sabowsla.com/blog/flutter-authentication-and-authorization-with-rls)
