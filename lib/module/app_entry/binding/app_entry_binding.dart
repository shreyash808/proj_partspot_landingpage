import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/controller/app_entry_controller.dart';

class AppEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppEntryController>(() => AppEntryController());
  }
}
