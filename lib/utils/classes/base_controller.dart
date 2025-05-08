import 'dart:async';
import 'package:get/get.dart';
import 'package:partyspot/utils/constants/app_enums.dart';

import '../../service/no_network/no_network_service.dart';

class BaseController extends GetxController {
  late StreamSubscription networkSubscription;
  bool hasNetworkConnection = true;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnectivity();
    _listenToConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final status = await NoNetworkService.checkConnectivity();
    hasNetworkConnection = status;
    updatedNetworkStatus(status);
  }

  void _listenToConnectivity() {
    networkSubscription = NoNetworkService.listen((connected) {
      updatedNetworkStatus(connected);
      hasNetworkConnection = connected;
      if (connected) {
        onNetworkRestore();
      }
    });
  }

  void onNetworkRestore() {}

  void updatedNetworkStatus(bool networkStatus) {}

  final Rx<bool> _isBusy = false.obs;

  bool get isBusy => _isBusy.value;

  void setBusy(bool busy) {
    _isBusy.value = busy;
  }

  final Rx<String> _errorMessage = ''.obs;

  String get errorMessage => _errorMessage.value;

  void setErrorMessage(String? val) {
    _errorMessage.value = val ?? '';
  }

  final Rx<ApiState> _state = ApiState.initial.obs;

  ApiState get state => _state.value;

  set state(ApiState busy) {
    _state.value = busy;
  }

  @override
  void onClose() {
    networkSubscription.cancel();
    super.onClose();
  }
}
