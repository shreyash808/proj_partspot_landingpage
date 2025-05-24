import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/binding/app_entry_binding.dart';
import 'package:partyspot/module/app_entry/presentation/app_entry_screen.dart';
import 'package:partyspot/module/representative/binding/representative_binding.dart';
import 'package:partyspot/module/representative/view/representative_screen.dart';
import 'package:partyspot/module/vip_plans/binding/beast_binding.dart';
import 'package:partyspot/module/vip_plans/view/beast_plan.dart';
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
import 'package:partyspot/module/party_spot_vip/binding/vip_binding.dart';
import 'package:partyspot/module/party_spot_vip/view/vip_screen.dart';
import 'package:partyspot/module/settings/binding/settings_binding.dart';
import 'package:partyspot/module/settings/view/settings_screen.dart';
import 'package:partyspot/module/splash/presentation/binding/splash_binding.dart';
import 'package:partyspot/module/splash/presentation/view/splash_screen.dart';
import 'package:partyspot/module/vip_plans/view/monster_plan_screen.dart';
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
        name: Routes.appEntryScreen,
        page: () => AppEntryScreen(),
        binding: AppEntryBinding(),
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

      GetPage(
        name: Routes.VipScreen,
        transition: Transition.circularReveal,
        page: () => VipScreen(),
        binding: VipBinding(),
      ),

      GetPage(
        name: Routes.settingsScreen,
        transition: Transition.circularReveal,
        page: () => SettingsScreen(),
        binding: SettingsBinding(),
      ),

      GetPage(
        name: Routes.beastPlanScreen,
        transition: Transition.circularReveal,
        page: () => BeastPlanScreen(),
        binding: BeastMonsterBinding(),
      ),

      GetPage(
        name: Routes.monsterPlanScreen,
        transition: Transition.circularReveal,
        page: () => monsterPlanScreen(),
        binding: BeastMonsterBinding(),
      ),

      GetPage(
        name: Routes.representativeScreen,
        transition: Transition.circularReveal,
        page: () => RepresentativeScreen(),
        binding: RepresentativeBinding(),
      ),
    ];
  }
}
