import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
 class NoNetworkService {
  static final Connectivity _connectivity = Connectivity();

 static Future<bool> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    return result.any(
      (e) => e.name == ConnectivityResult.wifi.name || e.name == ConnectivityResult.mobile.name,
    );
  }

  static StreamSubscription<bool> listen(
    void Function(bool)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _connectivity.onConnectivityChanged.map((event) => _isConnected(event)).distinct().listen(
          onData,
          onDone: onDone,
          cancelOnError: cancelOnError,
          onError: onError,
        );
  }

  static bool _isConnected(List<ConnectivityResult> result) {
    return result.any(
      (e) => e.name == ConnectivityResult.wifi.name || e.name == ConnectivityResult.mobile.name,
    );
  }
}
