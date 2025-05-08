import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();

  final RxBool _isConnected = true.obs;
  bool get isConnected => _isConnected.value;
  set isConnected(bool val) => _isConnected.value = val;

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkInitialConnection();
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    log(result.toList().toString());
    isConnected = result.any((e) => e.name == ConnectivityResult.wifi.name || e.name == ConnectivityResult.mobile.name) ? true : false;
  }

  Future<void> _checkInitialConnection() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result);
  }


  Future<void> retryConnection() async {
    await _checkInitialConnection();
  }
}