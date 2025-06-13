import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

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
    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });
  }

  final AuthRepository _loginRepository = locator<AuthRepository>();

  final Rx<String> _searchKey = Rx<String>('');
  String get searchKey => _searchKey.value;
  set searchKey(String val) => _searchKey.value = val;

  final Rx<String> _code = Rx<String>('');
  String get code => _code.value;
  set code(String val) => _code.value = val;


  onChangedSearch(String val) {
    searchKey = '';
    update();
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      searchKey = val;
      update();
    });
  }

  Future<void> onVerifyOtp(String? code,int? phoneNumber,{void Function()? onSuccess}) async {
    try {
      FullScreenLoading.show();
      final pushToken = await getPushToken();
      await _loginRepository.verifyOTP(phoneNumber: phoneNumber,otp: code,pushToken: pushToken);
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    FullScreenLoading.hide();
  }

  Future<String?> getPushToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    return FirebaseMessaging.instance.getToken();
  }


  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _debounce?.cancel();
  }
}
