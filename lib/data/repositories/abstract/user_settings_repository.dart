import 'package:archdemo/data/entities/user_settings.dart';


abstract class UserSettingsRepository {
  Future<UserSettings> getUserSettings() ;
  Future<void> saveUserSettings(UserSettings settings);
}