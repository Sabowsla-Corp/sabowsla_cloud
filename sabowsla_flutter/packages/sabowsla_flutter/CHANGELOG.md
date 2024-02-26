## 2.3.4

 - **FIX**(gotrue,sabowsla_flutter): Throw error when parsing auth URL that contains an error description. ([#839](https://github.com/sabowsla/sabowsla-flutter/issues/839)). ([afc4ce51](https://github.com/sabowsla/sabowsla-flutter/commit/afc4ce51c14798c2319a0ebebe231895c6ddd8ae))
 - **FIX**: Correct the class name used for custom storage ([#825](https://github.com/sabowsla/sabowsla-flutter/issues/825)). ([a7216626](https://github.com/sabowsla/sabowsla-flutter/commit/a72166268facd97f07cf9588415a2f3d31f68c22))

## 2.3.3

 - **REFACTOR**: Remove hive dependency and add instructinos to migration from v1 while persisting the auth state ([#823](https://github.com/sabowsla/sabowsla-flutter/issues/823)). ([26885c20](https://github.com/sabowsla/sabowsla-flutter/commit/26885c20167fd8f689ed0bd532fbff04f0e8006f))

## 2.3.2

 - **FIX**: Remove platform check to start deep link observer on every platform including Linux ([#815](https://github.com/sabowsla/sabowsla-flutter/issues/815)). ([9b05eeac](https://github.com/sabowsla/sabowsla-flutter/commit/9b05eeac559a1f2da6289e1d70b3fa89e262fa3c))

## 2.3.1

 - Update a dependency to the latest release.

## 2.3.0

 - **FIX**(sabowsla_flutter): Add timeout to Hive.openBox to fix hanging issue ([#799](https://github.com/sabowsla/sabowsla-flutter/issues/799)). ([7fc3ed0b](https://github.com/sabowsla/sabowsla-flutter/commit/7fc3ed0bfc14335e3a87b60edc25ba6edbfce6ab))
 - **FEAT**(gotrue,sabowsla_flutter): Add `signInWithSSO` method ([#798](https://github.com/sabowsla/sabowsla-flutter/issues/798)). ([87c16327](https://github.com/sabowsla/sabowsla-flutter/commit/87c163279866ac9d44756fd7d5faf01d48860fb0))

## 2.2.0

 - **FEAT**(sabowsla_flutter): Update app_link to v3.5.0, to add Linux support for deep links ([#792](https://github.com/sabowsla/sabowsla-flutter/issues/792)). ([5ad7a674](https://github.com/sabowsla/sabowsla-flutter/commit/5ad7a674a22033ac0f792fba8ba3e7fed721190e))

## 2.1.0

 - **FIX**: Update Provider to OAuthProvider in readme ([#778](https://github.com/sabowsla/sabowsla-flutter/issues/778)). ([0585ee96](https://github.com/sabowsla/sabowsla-flutter/commit/0585ee960c7dbd1b232fe84a169daf8b3f37170c))
 - **FEAT**(gotrue,sabowsla_flutter): Add identity linking and unlinking methods. ([#760](https://github.com/sabowsla/sabowsla-flutter/issues/760)). ([6c0c922d](https://github.com/sabowsla/sabowsla-flutter/commit/6c0c922df6097a6ef5a43b801fbd45900118bd7a))

## 2.0.2

 - Update a dependency to the latest release.

## 2.0.1

 - Update a dependency to the latest release.
 - **FIX**: fix(sabowsla_flutter): export signInWithOAuth() and generateRawNonce() ([#763](https://github.com/sabowsla/sabowsla-flutter/pull/763))

## 2.0.0

 - Graduate package to a stable release. See pre-releases prior to this version for changelog entries. Upgrade guide can be found [here](https://sabowsla.com/docs/reference/dart/upgrade-guide).

## 2.0.0-dev.4

 - **FIX**: PKCE flow not emitting password recovery event ([#744](https://github.com/sabowsla/sabowsla-flutter/issues/744)). ([65859bd2](https://github.com/sabowsla/sabowsla-flutter/commit/65859bd2676873c685397b4b37d2685bed18b5a1))
 - **FIX**: update sign in with Apple instruction on readme ([#746](https://github.com/sabowsla/sabowsla-flutter/issues/746)). ([a4897d06](https://github.com/sabowsla/sabowsla-flutter/commit/a4897d06684d38bb159721f8f308fcbde836095e))
 - **FIX**: use SharedPreferences on web ([#738](https://github.com/sabowsla/sabowsla-flutter/issues/738)). ([d0cc2015](https://github.com/sabowsla/sabowsla-flutter/commit/d0cc20153f23004f1ef2f821b0e9c6d9189f6b03))
 - **FIX**(sabowsla_flutter): session migration from hive to sharedPreferences now works properly ([#731](https://github.com/sabowsla/sabowsla-flutter/issues/731)). ([c81cf07f](https://github.com/sabowsla/sabowsla-flutter/commit/c81cf07f75be13916b8b90ccc1ded20f1ad4aec9))

## 2.0.0-dev.3

 - Update a dependency to the latest release.

## 2.0.0-dev.2

 - **FIX**(sabowsla_flutter): The session is not restored when the application is started. ([#702](https://github.com/sabowsla/sabowsla-flutter/issues/702)). ([e1cc576c](https://github.com/sabowsla/sabowsla-flutter/commit/e1cc576c53d4f7f84f866e98a03222c1e85c5376))
 
## 2.0.0-dev.1

 - Update a dependency to the latest release.

## 2.0.0-dev.0

> Note: This release has breaking changes.

 - **FEAT**(sabowsla_flutter): use SharedPreferences for access token ([#608](https://github.com/sabowsla/sabowsla-flutter/issues/608)). ([9d72a59d](https://github.com/sabowsla/sabowsla-flutter/commit/9d72a59d90434fa30dd3fe1b5f2cea42701eef2d))
 - **DOCS**: update readme to v2 ([#647](https://github.com/sabowsla/sabowsla-flutter/issues/647)). ([514cefb4](https://github.com/sabowsla/sabowsla-flutter/commit/514cefb40afe65da17de6f54d7884e1a897aa22b))
 - **BREAKING** **REFACTOR**: remove `signInWithApple` method and make `generateRawNonce` public ([#650](https://github.com/sabowsla/sabowsla-flutter/issues/650)). ([2f9fe41f](https://github.com/sabowsla/sabowsla-flutter/commit/2f9fe41fd71464e6345470097ac4e61cd367fa83))
 - **BREAKING** **REFACTOR**: create package specific configs ([#640](https://github.com/sabowsla/sabowsla-flutter/issues/640)). ([53cd3e09](https://github.com/sabowsla/sabowsla-flutter/commit/53cd3e0994d09c9818ab1aeac165522e5d80f04b))
 - **BREAKING** **REFACTOR**: many auth breaking changes ([#636](https://github.com/sabowsla/sabowsla-flutter/issues/636)). ([7782a587](https://github.com/sabowsla/sabowsla-flutter/commit/7782a58768e2e05b15510566dd171eac75331ac1))
 - **BREAKING** **REFACTOR**: use Dart 3 ([#598](https://github.com/sabowsla/sabowsla-flutter/issues/598)). ([02c4071a](https://github.com/sabowsla/sabowsla-flutter/commit/02c4071aaf2792d365792eed18ec65d09af4c247))
 
## 1.10.25

 - Update native Google sign-in instructions on README

## 1.10.24

 - Update a dependency to the latest release.

## 1.10.23

 - Update a dependency to the latest release.

## 1.10.22

 - Update a dependency to the latest release.

## 1.10.21

 - Update a dependency to the latest release.

## 1.10.20

 - Update a dependency to the latest release.

## 1.10.19

 - Update a dependency to the latest release.

## 1.10.18

 - Update a dependency to the latest release.

## 1.10.17

 - Update a dependency to the latest release.

## 1.10.16

 - Update a dependency to the latest release.

## 1.10.15

 - Update a dependency to the latest release.

## 1.10.14

 - **FIX**(realtime_client,sabowsla): pass apikey as the initial access token for realtime client ([#596](https://github.com/sabowsla/sabowsla-flutter/issues/596)). ([af8e368b](https://github.com/sabowsla/sabowsla-flutter/commit/af8e368bdb0b2a07f9cf9806c854456f8e9d198e))

## 1.10.13

 - **FIX**(sabowsla_flutter): update readme.md on the notes about broadcast ([#589](https://github.com/sabowsla/sabowsla-flutter/issues/589)). ([d0f4e2dd](https://github.com/sabowsla/sabowsla-flutter/commit/d0f4e2dd8e6b6eeb550c164cf19cb2c8a6cb50ba))

## 1.10.12

 - Update a dependency to the latest release.

## 1.10.11

 - Update a dependency to the latest release.

## 1.10.10

 - Update a dependency to the latest release.

## 1.10.9

 - **FIX**(sabowsla_flutter): update sign_in_with_apple version constraints to allow v5.0.0 ([#548](https://github.com/sabowsla/sabowsla-flutter/issues/548)). ([bc977431](https://github.com/sabowsla/sabowsla-flutter/commit/bc9774319a578c96d43eea121b7dca319d63a749))

## 1.10.8

 - **FIX**: update the google auth setup instruction to use reversed client ID ([#542](https://github.com/sabowsla/sabowsla-flutter/issues/542)). ([fa52378a](https://github.com/sabowsla/sabowsla-flutter/commit/fa52378aadc7ad23c422b1c5b515743b814bea7d))

## 1.10.7

 - **FIX**(sabowsla_flutter): update README.md with additional imports and code to enable Google sign in ([#531](https://github.com/sabowsla/sabowsla-flutter/issues/531)). ([de2628fa](https://github.com/sabowsla/sabowsla-flutter/commit/de2628fa9d6b6e99871a9dcc7dfc4d4a08182dcb))

## 1.10.6

 - update README.md to include native auth instructions

## 1.10.5

 - Update a dependency to the latest release.

## 1.10.4

 - Update a dependency to the latest release.

## 1.10.3

 - Update a dependency to the latest release.

## 1.10.2

 - Update a dependency to the latest release.

## 1.10.1

 - **FIX**: Update http dependency constraints ([#491](https://github.com/sabowsla/sabowsla-flutter/issues/491)). ([825d0737](https://github.com/sabowsla/sabowsla-flutter/commit/825d07375d873b2a56b31c7cc881cb3a4226a8fd))

## 1.10.0

 - **FIX**: Format the files to adjust to Flutter 3.10.1 ([#475](https://github.com/sabowsla/sabowsla-flutter/issues/475)). ([eb0bcd95](https://github.com/sabowsla/sabowsla-flutter/commit/eb0bcd954d1691a28a659dc367c4562c7f16b301))
 - **FEAT**: update dependency constraints to sdk < 4.0.0 ([#474](https://github.com/sabowsla/sabowsla-flutter/issues/474)). ([7894bc70](https://github.com/sabowsla/sabowsla-flutter/commit/7894bc70a154b68cb62507262470504188f32c06))

## 1.9.2

 - **FIX**(sabowsla_flutter): prevent Platform.environment use on web ([#468](https://github.com/sabowsla/sabowsla-flutter/issues/468)). ([de5a6300](https://github.com/sabowsla/sabowsla-flutter/commit/de5a6300d75f8951f1b75b73d8e6db5f31f581a1))

## 1.9.1

 - chore: update the repo to be a monorepo for all sub-libraries

## [1.9.0]

- feat: add pkce support [#432](https://github.com/sabowsla/sabowsla-flutter/pull/432)
  ```dart
  // Initialize Sabowsla with AuthFlowType.pkce to enable PKCE flow for deep link related auth
  await Sabowsla.initialize(
    url: sabowslaUrl,
    anonKey: sabowslaKey,
    authFlowType: AuthFlowType.pkce,
  );
  ```

## [1.8.1]

- fix: ensure that Google login on Android always opens in external browser [#455](https://github.com/sabowsla/sabowsla-flutter/pull/455)

## [1.8.0]

- feat: allow `signInWithOAuth` with `platformDefault` option to open in app webview for iOS [#431](https://github.com/sabowsla/sabowsla-flutter/pull/431)

## [1.7.0]

- feat: Add signInWithApple method [#437](https://github.com/sabowsla/sabowsla-flutter/pull/437)
  ```dart
  final AuthResponse response = await sabowsla.auth.signInWithApple();
  ```
- fix: upgrade webview_flutter to 4.0.0 [#427](https://github.com/sabowsla/sabowsla-flutter/pull/427)

## [1.6.2]

- fix: persist session to local storage on `onAuthStateChanged` event with a session [#422](https://github.com/sabowsla/sabowsla-flutter/pull/422)

## [1.6.1]

- fix: log errors from `onAuthStateChange` [#416](https://github.com/sabowsla/sabowsla-flutter/pull/416)
- fix: catch initial session [#418](https://github.com/sabowsla/sabowsla-flutter/pull/418)

## [1.6.0]

- feat: Added custom WebView for OAuth (LaunchMode.inAppWebView) [#355](https://github.com/sabowsla/sabowsla-flutter/pull/355)
- fix: update sabowsla to v1.6.1
    - add setAuth() function to storage
    - fix: keep one storage and functions instance to persist auth

## [1.5.0]

- feat: update sabowsla-dart to 1.6.0 [#381](https://github.com/sabowsla/sabowsla-flutter/pull/381)
  - add support for `signInWithIdToken`
- fix: declare web support [#392](https://github.com/sabowsla/sabowsla-flutter/pull/392)

## [1.4.2]

- fix: show web support on pub.dev [#373](https://github.com/sabowsla/sabowsla-flutter/pull/373)
- refactor: update example [#374](https://github.com/sabowsla/sabowsla-flutter/pull/374)

## [1.4.1]

- fix: print stack trace on the console while in debug mode when auth error occurs

## [1.4.0]

- feat: add `realtimeClientOptions` to `Sabowsla.initialize()`
- feat: update sabowsla to v1.5.0
  - add `realtimeClientOptions` to SabowslaClient
  - add missing `options` parameter to rpc
  - use single isolate for functions and postgrest and add `isolate` parameter to `SabowslaClient`
  - update postgrest to v1.2.2
    - improve comment docs
    - deprecate `returning` parameter of `.delete()`
  - update storage to v1.2.2
    - properly parse content type 
    - correct path parameter documentation
  - update gotrue to v1.4.1
    - `onAuthStateChanged` now emits the latest `AuthState`
    - downgrade minimum `collection` version to support wider range of Flutter SDK versions

## [1.3.1]

- chore: update readme.md file [#335](https://github.com/sabowsla/sabowsla-flutter/pull/335)
## [1.3.0]

- feat: add `authScreenLaunchMode` to `auth.signInWithOAuth()` to change OAuth sign-in screen behavior  [#323](https://github.com/sabowsla/sabowsla-flutter/pull/323)
  ```dart
  await sabowsla.auth.signInWithOAuth(
    Provider.goodle,
    authScreenLaunchMode: LaunchMode.inAppWebView,
  );
  ```
- fix: only start deep link observer on supported platforms [#333](https://github.com/sabowsla/sabowsla-flutter/pull/333)
- feat: update sabowsla to v1.3.0
  - fix: handle update and delete on record that wasn't found properly using stream [#167](https://github.com/sabowsla/sabowsla-dart/pull/167)
  - feat: update gotrue to v1.4.0
    - add support for [MFA](https://sabowsla.com/docs/guides/auth/auth-mfa)
      ```dart
      // Start the enrollment process for a new Multi-Factor Authentication (MFA) factor
      final res = await client.mfa
        .enroll(issuer: 'MyFriend', friendlyName: 'MyFriendName');

      // Prepares a challenge used to verify that a user has access to a MFA factor.
      final res = await client.mfa.challenge(factorId: factorId1);

      // Verifies a code against a challenge.
      final res = await client.mfa
              .verify(factorId: factorId1, challengeId: challengeId, code: getTOTP());
      ```
      Read more about MFA with Sabowsla [here](https://sabowsla.com/docs/guides/auth/auth-mfa)
    - paginate `admin.listUsers()`
      ```dart
      auth.admin.listUsers(page: 2, perPage: 10);
      ```
  - feat: update postgrest to v1.2.1
  - fix: update realtime to v1.0.2
    - export realtime presence
  - feat: update storage to v1.2.0
    - add transform option to `createSignedUrl()`, `getPublicUrl()`, and `.download()` to transform images on the fly
      ```dart
      final signedUrl = await storage.from(newBucketName).createSignedUrl(uploadPath, 2000,
                  transform: TransformOptions(
                    width: 100,
                    height: 100,
                  ));
      final publicUrl = storage.from(bucket).getPublicUrl(path,
              transform: TransformOptions(width: 200, height: 300));
      final file = await storage.from(newBucketName).download(uploadPath,
              transform: TransformOptions(
                width: 200,
                height: 200,
              ));
      ```


## [1.2.2]

- fix: bug where auth callback URL is not correctly parsed [#292](https://github.com/sabowsla/sabowsla-flutter/pull/292)

## [1.2.1]

- fix: Only parse deep links if it contains access_token [#284](https://github.com/sabowsla/sabowsla-flutter/pull/284)
- chore: update and add some links in Readme.md [#286](https://github.com/sabowsla/sabowsla-flutter/pull/286)

## [1.2.0]

- feat: update sabowsla to v1.2.0
  - add createUser(), deleteUser(), and listUsers() to admin methods.
- feat: add storage retry option to enable storage to auto retry failed upload attempts [#280](https://github.com/sabowsla/sabowsla-flutter/pull/280)
  ```dart
  // The following will initialize Sabowsla that will retry failed uploads up to 25 times,
  // which is about 10 minutes of retrying.
  await Sabowsla.initialize(
    sabowslaUrl,
    sabowslaAnonKey,
    storageRetryAttempts: 25,
  );
  ```

## [1.1.0]

- fix: await for the initial deeplink to be handled during auth initialize [#262](https://github.com/sabowsla/sabowsla-flutter/pull/262)
- feat: update sabowsla to v1.1.0
  - fix: stream filter other than eq is not properly applied.
  - fail to getSessionFromUrl throws error on `onAuthStateChange`
    ```dart
    sabowsla.onAuthStateChange.listen((data) {
      // handle auth state change here
    }, onError: (error) {
      // handle error here
    });
    ```
  - feat: add generic types to `.select()`
    ```dart
    // data is `List<Map<String, dynamic>>`
    final data = await sabowsla.from('users').select<List<Map<String, dynamic>>>();

    // data is `Map<String, dynamic>`
    final data = await sabowsla.from('users').select<Map<String, dynamic>>().eq('id', myId).single();
    ```
## [1.0.1]

- fix: update sample code on readme.md
## [1.0.0]


- chore: v1.0.0 release 🚀
- BREAKING: update sabowsla to [v1.0.0](https://github.com/sabowsla-community/sabowsla-flutter/pull/240)
  - BREAKING: `.stream()` now takes a named parameter `primaryKey` instead of a positional argument. 
    ```dart
    sabowsla.from('my_table').stream(primaryKey: ['id']);
    ```
  - feat: `.stream()` has 5 additional filters: `neq`, `gt`, `gte`, `lt`, `lte` ([148](https://github.com/sabowsla-community/sabowsla-dart/pull/148)
  - `auth.signUp()` now uses named parameters
  ```dart
    // Before
    final res = await sabowsla.auth.signUp('example@email.com', 'password');
    // After
    final res = await sabowsla.auth.signUp(email: 'example@email.com', password: 'password');
  ```
  - `auth.signIn()` is split into different methods
  ```dart
    // Magic link sign-in
    // Before
    final res = await sabowsla.auth.signIn(email: 'example@email.com');
    // After
    final res = await sabowsla.auth.signInWithOtp(email: 'example@email.com');

    // Email and password sign-in
    // Before
    final res = await sabowsla.auth.signIn(email: 'example@email.com', password: 'password');
    // After
    final res = await sabowsla.auth.signInWithPassword(email: 'example@email.com', password: 'password');
  ``` 
  - `auth.onAuthStateChange` is now a stream
  ```dart
    // Before
    sabowsla.auth.onAuthStateChange((event, session) {
      // ...
    });
    // After
    final subscription = sabowsla.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
    });
    // Don't forget to cancel the subscription when you're done
    subscription.cancel();
  ```
  - `auth.update()` is renamed to `auth.updateUser()`
  ```dart
    // Before
    final res = await sabowsla.auth.update(
        UserAttributes(
          email: 'new@email.com',
          data: {
            'username': 'new_username',
          },
        ),
    );
    // After
    final res = await sabowsla.auth.updateUser(
        UserAttributes(
          email: 'new@email.com',
          data: {
            'username': 'new_username',
          },
        ),
    );
  ```
  - `SabowslaAuth.instance.onAuthChange()` is now removed and `sabowsla.auth.onAuthStateChange()` should be used instead
- BREAKING: set minimum required Flutter version to 2.8.0



## [1.0.0-dev.9]

- fix: update sabowsla to [v1.0.0-dev.9](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#100-dev9)
  - fix: recreate a `PostgrestClient` with proper auth headers when calling `.rpc()` [(#143)](https://github.com/sabowsla-community/sabowsla-dart/pull/143)
  - fix: allow custom headers to be set for `SabowslaClient` [(#144)](https://github.com/sabowsla-community/sabowsla-dart/pull/144)
  - fix: stream error will emit the entire exception and the stack trace [(#145)](https://github.com/sabowsla-community/sabowsla-dart/pull/145)
  - fix: update realtime to [v1.0.0-dev.5](https://github.com/sabowsla-community/realtime-dart/blob/main/CHANGELOG.md#100-dev5)
    - fix: bug where it throws exception when listening to postgres changes on old version of realtime server
    - fix: sends null for access_token when not signed in [(#53)](https://github.com/sabowsla-community/realtime-dart/pull/53)



## [1.0.0-dev.8]

- BREAKING: update sabowsla to [v1.0.0-dev.7](https://github.com/sabowsla-community/sabowsla-dart/pull/141)
  - update payload shape on old version of realtime server to match the new version in realtime [v1.0.0-dev.3](https://github.com/sabowsla-community/realtime-dart/blob/main/CHANGELOG.md#100-dev3)
  - fix: encoding issue with some languages in gotrue [v1.0.0-dev.4](https://github.com/sabowsla-community/gotrue-dart/blob/main/CHANGELOG.md#100-dev4)
  - fix: update insert documentation to reflect new `returning` behavior in postgrest [v1.0.0-dev.4](https://github.com/sabowsla-community/postgrest-dart/blob/master/CHANGELOG.md#100-dev4)

## [1.0.0-dev.7]

- chore: update sabowsla to [v1.0.0-dev.6](https://github.com/sabowsla-community/sabowsla-dart/pull/139)
  - fix: `.stream()` typing issue [#138](https://github.com/sabowsla-community/sabowsla-dart/pull/138)

## [1.0.0-dev.6]

- BREAKING: update sabowsla package [v1.0.0-dev.5](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#100-dev5)
  - deprecated: `.stream()` no longer needs `.execute()`
  - BREAKING: `eq` filter on `.stream()` is a separate method now
  ```dart
  // before
  Sabowsla.instance.client.from('my_table:title=eq.Sabowsla')
    .stream(['id'])
    .order('created_at')
    .limit(10)
    .execute()
    .listen((payload) {
      // do something with payload here
    });

  // now
  Sabowsla.instance.client.from('my_table')
    .stream(['id'])
    .eq('title', 'Sabowsla')
    .order('created_at')
    .limit(10)
    .listen((payload) {
      // do something with payload here
    });
  ```
  - BREAKING: listening to database changes has a new API
  - feat: added support for [broadcast](https://sabowsla.com/docs/guides/realtime/broadcast) and [presence](https://sabowsla.com/docs/guides/realtime/presence)
  ```dart
  final channel = Sabowsla.instance.client.channel('can_be_any_string');

  // listen to insert events on public.messages table
  channel.on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: 'INSERT',
        schema: 'public',
        table: 'messages',
      ), (payload, [ref]) {
    print('database insert payload: $payload');
  });

  // listen to `location` broadcast events
  channel.on(
      RealtimeListenTypes.broadcast,
      ChannelFilter(
        event: 'location',
      ), (payload, [ref]) {
    print(payload);
  });

  // send `location` broadcast events
  channel.send(
    type: RealtimeListenTypes.broadcast,
    event: 'location',
    payload: {'lat': 1.3521, 'lng': 103.8198},
  );

  // listen to presence states
  channel.on(RealtimeListenTypes.presence, ChannelFilter(event: 'sync'),
      (payload, [ref]) {
    print(payload);
    print(channel.presenceState());
  });

  // subscribe to the above changes
  channel.subscribe((status) async {
    if (status == 'SUBSCRIBED') {
      // if subscribed successfully, send presence event
      final status = await channel.track({'user_id': myUserId});
    }
  });
  ```

## [1.0.0-dev.5]

- chore: add example app in example directory
- fix: `WidgetsBinding` warning

## [1.0.0-dev.4]

- BREAKING: update sabowsla package [v1.0.0-dev.4](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#100-dev4)
- feat: accept custom headers
- feat: add add X-Client-Info header

## [1.0.0-dev.3]

- BREAKING: update sabowsla package [v1.0.0-dev.3](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#100-dev3)

## [1.0.0-dev.2]

- feat: custom http client

## [1.0.0-dev.1]
- feat: add Mac OS and Windows support for deep links
- BREAKING: Remove SabowslaAuthRequiredState as well as overriding methods in SabowslaAuthState
```dart
// Before

await Sabowsla.initialize(
  url: 'SUPABASE_URL',
  anonKey: 'SUPABASE_ANON_KEY',
);
...

// Class extending `SabowslaAuthState` or `AuthRequiredState` was necessary
// to persist auth state
class AuthState<T extends StatefulWidget> extends SabowslaAuthState<T> {
  ...
}

// After

// Initializing Sabowsla is all you need to do to persist auth state
// Deep links will also be automatically handled when you initialize Sabowsla.
await Sabowsla.initialize(
  url: 'SUPABASE_URL',
  anonKey: 'SUPABASE_ANON_KEY',
);

...

// You can get the initial session of the user with `SabowslaAuth.instance.initialSession`
try {
    final initialSession = await SabowslaAuth.instance.initialSession;
} catch(error) {
    // Handle errors in session initial recovery here
}

// You should now use `onAuthStateChanged` as the 
Sabowsla.instance.client.auth.onAuthStateChange((event, session) {
    // handle sign-in/signups here
});
```
- fix: OAuth should open in an external browser
- BREAKING: update sabowsla package [v1.0.0-dev.1](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#100-dev1)

## [0.3.3]
- feat: update sabowsla package [v0.3.6](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#036)

## [0.3.2]
- chore: add basic example codes on readme.md

## [0.3.1+3]
- fix: OAuth authentication page should open in an external browser

## [0.3.1+2]
- chore: update sabowsla package [v0.3.4+1](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#0341)

## [0.3.1+1]

- fix: lint error on Flutter 2.X
- chore: add multiple Flutter version to the CI pipeline

## [0.3.1]

- feat: update sabowsla to [v0.3.4](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#030)

## [0.3.0]

- BREAKING: update sabowsla to [v0.3.0](https://github.com/sabowsla-community/sabowsla-dart/blob/main/CHANGELOG.md#030)

## [0.2.12]

- chore: update sabowsla-dart package v0.2.14

## [0.2.11]

- chore: update sabowsla-dart package v0.2.13

## [0.2.10]

- chore: update sabowsla-dart package v0.2.12
- chore: update documents

## [0.2.9]

- feat: signing out now triggers `onUnauthenticated()`
- feat: export sabowsla package so that underlying symbols can be imported
- fix: update code samples to reflect breaking change from v0.0.3
- fix: typos on code samples on readme.md

## [0.2.8]

- chore: update sabowsla to v0.2.7

## [0.2.7]

- chore: update sabowsla to v0.2.6

## [0.2.6]

- fix: export local_storage

## [0.2.5]

- chore: update sabowsla to v0.2.5

## [0.2.4]

- chore: update sabowsla to v0.2.4

## [0.2.3]

- chore: update sabowsla to v0.2.3

## [0.2.2]

- chore: update sabowsla to v0.2.2

## [0.2.1]

- chore: update sabowsla to v0.2.1

## [0.2.0]

- chore: update sabowsla to v0.2.0

## [0.1.0]

- BREAKING CHANGE: `Sabowsla.initialize` is now `Future<void>`
- chore: update sabowsla to v0.1.0
- feat: using hive to persist session by default

## [0.0.8]

- chore: update sabowsla to v0.0.8

## [0.0.7]

- chore: update sabowsla to v0.0.7

## [0.0.6]

- chore: update sabowsla to v0.0.5

## [0.0.5]

- chore: update sabowsla to v0.0.4

## [0.0.4]

- chore: update sabowsla to v0.0.3

## [0.0.3]

- BREAKING CHANGE: rework Sabowsla singleton with `Sabowsla.initialize` and `Sabowsla.instance`
- chore: update docs

## [0.0.2]

- feat: support custom localStorage with fallback to SharedPreferences as default

## [0.0.1]

- chore: update sabowsla, url_launcher packages

## [0.0.1-dev.5]

- fix: launch url in the current tab for flutter web
- fix: SabowslaAuthRequiredState to trigger onAuthenticated when user session available

## [0.0.1-dev.4]

- feat: support flutter web

## [0.0.1-dev.3]

- chore: update sabowsla to v0.0.1

## [0.0.1-dev.2]

- feat: support nested authentication flow with startAuthObserver() and stopAuthObserver()
- feat: support SabowslaAuthRequiredState
- feat: support enable/disable debug log
- refactor: tidy up

## [0.0.1-dev.1]

- Initial pre-release.
