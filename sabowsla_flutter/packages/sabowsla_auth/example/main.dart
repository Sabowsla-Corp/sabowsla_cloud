import 'package:sabowsla_auth/sabowsla_auth.dart';
import 'package:sabowsla_auth/src/sabowsla_auth.dart';

Future<bool> main(List<String> arguments) async {
  const sabowslaAuthurl = 'http://localhost:1203';
  const annonToken = '';
  final client = SabowslaAuth(
    url: sabowslaAuthurl,
    headers: {
      'Authorization': 'Bearer $annonToken',
      'apikey': annonToken,
    },
  );

  try {
    final login = await client.signInWithPassword(
      email: 'email',
      password: '12345',
    );
    print('Logged in, uid: ${login.session!.user.id}');
  } on AuthException catch (error) {
    print('Sign in Error: ${error.message}');
  }

  await client.signOut();
  print('Logged out!');
  return true;
}
