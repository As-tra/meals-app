import 'dart:io';

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    print(_);
    return false;
  }
}
