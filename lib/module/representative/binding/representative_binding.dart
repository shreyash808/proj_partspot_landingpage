import 'package:get/get.dart';
import 'package:partyspot/module/representative/controller/representative_controller.dart';

class RepresentativeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepresentativeController>(() => RepresentativeController());
  }
}
