import 'package:get/get.dart';
import 'package:partyspot/module/profile/controller/user_detail_controller.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(() => UserDetailController());
  }
}
