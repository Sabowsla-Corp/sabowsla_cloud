import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/sabowsla_flutter.dart';
import 'widget_test_stubs.dart';

void main() {
  const sabowslaUrl = '';
  const sabowslaKey = '';

  setUpAll(() async {
    mockAppLink();
  });

  testWidgets('Signing out triggers AuthChangeEvent.signedOut event',
      (tester) async {
    // Initialize the Sabowsla singleton
    await Sabowsla.initialize(
      url: sabowslaUrl,
      anonKey: sabowslaKey,
      authOptions: FlutterAuthClientOptions(
        localStorage: MockLocalStorage(),
        pkceAsyncStorage: MockAsyncStorage(),
      ),
    );
    await tester.pumpWidget(const MaterialApp(home: MockWidget()));
    await tester.tap(find.text('Sign out'));
    await tester.pump();
    expect(find.text('You have signed out'), findsOneWidget);
  });
}
