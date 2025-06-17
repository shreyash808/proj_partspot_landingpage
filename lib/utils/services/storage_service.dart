import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../utils/constants/key_constants.dart';

class StorageService {
  static const _secureStorage = FlutterSecureStorage();

  Future<String> get accessToken async {
    return await _secureStorage.read(key: KeysConsts.accessTokenKey) ?? '';
  }

  Future<bool> get isOnBoardVisited async {
    final value = await _secureStorage.read(key: KeysConsts.isOnBoardVisitedKey);
    return value == 'true'; // Stored as string
  }

  Future<void> setAccessToken(String? token) async {
    await _secureStorage.write(key: KeysConsts.accessTokenKey, value: token);
  }

  Future<void> setIsOnBoardVisited(bool val) async {
    await _secureStorage.write(key: KeysConsts.isOnBoardVisitedKey, value: val.toString());
  }

  Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }

  Future<void> clearSession() async {
    await _secureStorage.delete(key: KeysConsts.accessTokenKey);
  }
}
