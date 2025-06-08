import 'package:get/get.dart';
import 'package:partyspot/module/login/presentation/controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
