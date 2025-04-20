import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class Network {
  static Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<ConnectivityResult> getConnectivityStatus() async {
    return await Connectivity().checkConnectivity();
  }

  static Stream<ConnectivityResult> getConnectivityStream() {
    return Connectivity().onConnectivityChanged;
  }

  static Future<bool> isWifiConnected() async {
    final status = await getConnectivityStatus();
    return status == ConnectivityResult.wifi;
  }

  static Future<bool> isMobileConnected() async {
    final status = await getConnectivityStatus();
    return status == ConnectivityResult.mobile;
  }

  static Future<bool> isEthernetConnected() async {
    final status = await getConnectivityStatus();
    return status == ConnectivityResult.ethernet;
  }
}
