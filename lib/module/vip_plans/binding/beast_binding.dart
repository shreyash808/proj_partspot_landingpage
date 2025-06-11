import 'package:get/get.dart';
import 'package:partyspot/module/vip_plans/controller/beast_controller.dart';

class BeastMonsterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeastController>(() => BeastController());
  }
}
