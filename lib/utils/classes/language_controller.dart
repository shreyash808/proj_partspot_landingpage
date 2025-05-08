import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/storage_service.dart';

import '../constants/app_enums.dart';

class LanguageController extends GetxController {
  var selectedLocale = const Locale('en').obs; // default locale is English

  static const String languageCodeKey = 'language_code';
  final storage = locator<StorageService>();

  Future<void> loadSavedLanguage() async {
    if (storage.languageCode != null) {
      selectedLocale.value = Locale(storage.languageCode!);
      Get.updateLocale(selectedLocale.value);
    }
  }

  Locale get getCurrentLocale => Get.locale ?? const Locale('en');

  Language get getCurrentLanguage {
    if (Get.locale?.languageCode == 'ar') {
      return Language.arabic;
    } else if (Get.locale?.languageCode == 'en') {
      return Language.english;
    } else {
      return Language.other;
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    selectedLocale.value = Locale(languageCode);
    Get.updateLocale(selectedLocale.value);
    storage.setLanguageCode(languageCode);
  }

}
