import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNet {
  Future<bool> checkInternet() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
