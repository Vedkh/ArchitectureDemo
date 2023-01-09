import 'package:archdemo/data/repositories/abstract/user_settings_repository.dart';
import 'package:archdemo/data/repositories/implementation/secure_storage_user_repository.dart';


class UserSettingsRepositoryFactory {
  static UserSettingsRepository createUserSettingsRepository(){
    return SecureStorageUserRepository();
  }
}