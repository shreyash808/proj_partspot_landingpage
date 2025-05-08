import 'package:get_storage/get_storage.dart';
import 'package:partyspot/utils/constants/key_constants.dart';

class StorageService {
  static final _storage = GetStorage();

  String get accessToken => _storage.read(KeysConsts.accessToken) ?? '';

  String? get languageCode => _storage.read(KeysConsts.languageCodeKey);

  bool get isOnBoardVisited => _storage.read(KeysConsts.isOnBoardVisitedKey) ?? false;

  bool get isChooseLanguageVisited => _storage.read(KeysConsts.isChooseLanguageVisitedKey) ?? false;

  Future<void> setAccessToken(String? token) async {
    await _storage.write(KeysConsts.accessToken, token);
  }

  Future<void> setLanguageCode(String? locale) async {
    await _storage.write(KeysConsts.languageCodeKey, locale);
  }


  Future<void> setIsOnBoardVisited(bool val) async {
    await _storage.write(KeysConsts.isOnBoardVisitedKey, val);
  }

  Future<void> setIsChooseLanguageVisited(bool val) async {
    await _storage.write(KeysConsts.isChooseLanguageVisitedKey, val);
  }

  void clearAllData() async {
    await _storage.erase();
  }

  Future clearSession() async {
    await _storage.remove(KeysConsts.accessToken);
  }
}
