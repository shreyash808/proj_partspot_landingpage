import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/theme/app_theme.dart';
import 'package:partyspot/utils/theme/dark_theme.dart';
import 'package:partyspot/utils/theme/light_theme.dart';

class ThemeController extends GetxController {

  final Rx<AppTheme> _appTheme = LightTheme().obs;
  AppTheme get appTheme => _appTheme.value;
  set appTheme(AppTheme value) => _appTheme.value = value;

  void toggleTheme(BuildContext context) {
    if (appTheme is LightTheme) {
      appTheme = DarkTheme();
    } else {
      appTheme = LightTheme();
    }

    Get.changeTheme(appTheme.themeData(context));
  }
}
