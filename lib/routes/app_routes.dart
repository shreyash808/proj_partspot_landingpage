import 'package:get/get.dart';
import 'package:partyspot/module/explore/binding/explore_binding.dart';
import 'package:partyspot/module/explore/view/explore_screen.dart';
import 'package:partyspot/module/home/presentation/binding/home_binding.dart';
import 'package:partyspot/module/home/presentation/view/home_screen.dart';
import 'package:partyspot/module/login/presentation/binding/login_binding.dart';
import 'package:partyspot/module/login/presentation/view/login_screen.dart';
import 'package:partyspot/module/login_otp/binding/otp_binding.dart';
import 'package:partyspot/module/login_otp/view/otp_screen.dart';
import 'package:partyspot/module/onboarding/presentation/binding/onboarding_binding.dart';
import 'package:partyspot/module/onboarding/presentation/view/onboarding_screen.dart';
import 'package:partyspot/module/splash/presentation/binding/splash_binding.dart';
import 'package:partyspot/module/splash/presentation/view/splash_screen.dart';
import 'package:partyspot/routes/routes_const.dart';

class AppRoutes {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: '/',
        transition: Transition.circularReveal,
        page: () => SplashScreen(),
        binding: SplashBinding(),
      ),

      GetPage(
        name: Routes.onBoardingScreen,
        transition: Transition.circularReveal,
        page: () => OnboardingScreen(),
        binding: OnboardingBinding(),
      ),

      GetPage(
        name: Routes.loginScreen,
        transition: Transition.circularReveal,
        page: () => LoginScreen(),
        binding: LoginBinding(),
      ),

      GetPage(
        name: Routes.otpScreen,
        transition: Transition.circularReveal,
        page: () => OtpScreen(),
        binding: OtpBinding(),
      ),
      GetPage(
        name: Routes.homeScreen,
        transition: Transition.circularReveal,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),

      GetPage(
        name: Routes.exploreScreen,
        transition: Transition.circularReveal,
        page: () => ExploreScreen(),
        binding: ExploreBinding(),
      ),
    ];
  }
}
