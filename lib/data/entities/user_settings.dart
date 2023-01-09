import 'package:flutter/foundation.dart';


class UserSettings {
  late String _jwtAccess;
  late String _jwtRenew;
  late String _serverName;
  late String _firebaseToken;
  late String _uuid;
  late String _languageCode;

  UserSettings({required String accessToken, required String renewToken, required String serverName,
    required String firebaseToken, required String uuid, required String languageCode}){
    _jwtAccess = accessToken;
    _jwtRenew = renewToken;
    _serverName = serverName;
    _firebaseToken = firebaseToken;
    _uuid = uuid;
    _languageCode = languageCode;
  }

  String get jwtAccess => _jwtAccess;
  String get jwtRenew => _jwtRenew;
  String get server => _serverName;
  String get firebaseToken => _firebaseToken;
  String get uuid => _uuid;
  String get languageCode => _languageCode;

  bool get isAuthenticated => _jwtAccess.isNotEmpty && _jwtRenew.isNotEmpty;

  UserSettings copyWith({String? jwtAccess, String? jwtRenew, String? serverName,
    String? firebaseToken, String? uuid, String? languageCode}){
    return UserSettings(
      accessToken: jwtAccess ?? _jwtAccess,
      serverName: serverName ?? _serverName,
      firebaseToken: firebaseToken ?? _firebaseToken,
      uuid: uuid ?? _uuid,
      renewToken: jwtRenew ?? _jwtRenew,
      languageCode: languageCode ?? _languageCode,
    );
  }

  @override
  String toString(){
    if(kDebugMode) {
      return "UserSettings {access: $_jwtAccess, renew: $_jwtRenew}, firebaseToken:$_firebaseToken\n";
    } else {
      return "";
    }
  }
}