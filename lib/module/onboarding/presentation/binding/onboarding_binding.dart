import 'package:get/get.dart';
import 'package:partyspot/module/onboarding/presentation/controller/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
