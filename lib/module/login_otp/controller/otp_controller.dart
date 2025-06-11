import 'dart:async';

import 'package:get/get.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class OtpController extends BaseController {
  final RxInt timer = 20.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  Timer? _debounce;

  void startTimer() {
    _timer?.cancel();
    timer.value = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer.value <= 0) {
        timer.cancel();
      } else {
        this.timer.value--;
      }
    });
  }

  final Rx<String> _searchKey = Rx<String>('');
  String get searchKey => _searchKey.value;
  set searchKey(String val) => _searchKey.value = val;

  onChangedSearch(String val) {
    searchKey = '';
    update();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      searchKey = val;
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
