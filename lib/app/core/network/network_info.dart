import 'dart:io';

// abstract class NetworkInfo {
//   Future<bool> isConnected();
// }

Future<bool> isConnectedToNetwork() async {
  
  bool connected = false;
  
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } on SocketException catch (e) {
      // connected = false;
      print(e.message);
    }

    return connected;

  }