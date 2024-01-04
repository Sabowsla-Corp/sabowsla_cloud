import 'dart:io';

Future<bool> checkInternetConnection() async {
  //No platform implementation is done yet, return true for test purposes
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return true;
  }

  try {
    final result = await InternetAddress.lookup('www.google.com')
        .timeout(const Duration(seconds: 50));

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return true;
  } catch (e) {
    return false;
  }
}
