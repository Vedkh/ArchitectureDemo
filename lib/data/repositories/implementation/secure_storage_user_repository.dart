import 'package:archdemo/data/api/demo_api.dart';
import 'package:archdemo/data/entities/user_settings.dart';
import 'package:archdemo/data/repositories/abstract/user_settings_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorageUserRepository implements UserSettingsRepository {
  static const serverDefault = DemoApi.serverUrl;
  static const accessJwt = '812';
  static const renewJwt = '314';
  static const serverName = '2';
  static const firebaseToken = '3';
  static const uuid = '4';
  static const langCode = '5';

  @override
  Future<UserSettings> getUserSettings() async {
    const storage = FlutterSecureStorage();
    Map<String, String> allValues = await storage.readAll();
    final jwtAccess = (null == allValues[accessJwt]) ? '' : allValues[accessJwt]!;
    final jwtRenew = (null == allValues[renewJwt]) ? '' : allValues[renewJwt]!;
    final server = allValues.containsKey(serverName) ? ((null == allValues[serverName]) ? serverDefault : allValues[serverName]!) : serverDefault;
    final firebase = allValues.containsKey(firebaseToken) ? ((null == allValues[firebaseToken]) ? '' : allValues[firebaseToken]!) : '';
    final uuidValue = allValues.containsKey(uuid) ? ((null == allValues[uuid]) ? '' : allValues[uuid]!) : '';
    final languageCode = allValues.containsKey(langCode) ? ((null == allValues[langCode]) ? 'en_us' : allValues[langCode]!) : 'en_us';
    return UserSettings(
      accessToken: jwtAccess,
      renewToken: jwtRenew,
      serverName: server,
      firebaseToken: firebase,
      uuid: uuidValue,
      languageCode: languageCode,
    );
  }

  @override
  Future<void> saveUserSettings(UserSettings settings) async {
    const storage = FlutterSecureStorage();
    storage.write(key: accessJwt, value: settings.jwtAccess);
    storage.write(key: renewJwt, value: settings.jwtRenew);
    storage.write(key: serverName, value: settings.server);
    storage.write(key: firebaseToken, value: settings.firebaseToken);
    storage.write(key: langCode, value: settings.languageCode);
  }

}