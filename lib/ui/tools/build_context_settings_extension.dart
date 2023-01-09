import 'package:archdemo/data/api/demo_api.dart';
import 'package:archdemo/data/entities/user_settings.dart';
import 'package:flutter/material.dart';


extension BuildContextSettingsExtension on BuildContext {
  static UserSettings? _userSettings;

  UserSettings get userSettings => (null == _userSettings) ? UserSettings(
    accessToken: '',
    renewToken: '',
    serverName: DemoApi.serverUrl,
    firebaseToken: '',
    uuid: '',
    languageCode: 'en_us'
  ) : _userSettings!;

  set userSettings(UserSettings settings) => _userSettings = settings;

}