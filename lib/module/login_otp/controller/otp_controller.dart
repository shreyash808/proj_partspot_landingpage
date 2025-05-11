import 'dart:async';

import 'package:get/get.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class OtpController extends BaseController {
  Timer? _debounce;

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
}
