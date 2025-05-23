import 'package:get/get.dart';
import 'package:partyspot/module/party_spot_vip/controller/vip_controller.dart';

class VipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VipController>(() => VipController());
  }
}
