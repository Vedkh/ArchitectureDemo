// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:archdemo/data/api/responses/authentication_response.dart';
import 'package:archdemo/data/entities/user_settings.dart';
import 'package:archdemo/data/repositories/abstract/user_settings_repository.dart';
import 'package:archdemo/data/repositories/factories/user_settings/user_settings_repository_factory.dart';
import 'package:archdemo/ui/tools/navigation_helper.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class DioInterceptorsFactory{
  static UserSettingsRepository? _repository;
  static InterceptorsWrapper? _loggingInterceptor;
  static InterceptorsWrapper? _authenticationInterceptor;
  static String _jwtAccess = '';
  static String _jwtRenew = '';
  static String _serverName = '';

  static InterceptorsWrapper? createLoggingInterceptor() {
    if((kDebugMode) && (null == _loggingInterceptor)){
      _loggingInterceptor = InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
        String headers = "";
        options.headers.forEach((key, value) {
          headers += "| $key: $value";
        });
        print("┌------------------------------------------------------------------------------");
        print('''| [DIO] Request: ${options.method} ${options.uri} | ${options.data.toString()} | Headers:\n$headers''');
        print('''\n| Access token: $_jwtAccess | Renew token: $_jwtRenew \n''');
        print("├------------------------------------------------------------------------------");
        handler.next(options);  //continue
      }, onResponse: (Response response, handler) async {
        print("| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}");
        print("└------------------------------------------------------------------------------");
        handler.next(response);
        // return response; // continue
      }, onError: (DioError error, handler) async {
        print("| [DIO] Error: ${error.error}: ${error.response.toString()}");
        print("└------------------------------------------------------------------------------");
        handler.next(error); //continue
      });
    }
    return _loggingInterceptor;
  }

  static Future<InterceptorsWrapper> createAuthenticationInterceptor() async {
    _repository ??= UserSettingsRepositoryFactory.createUserSettingsRepository();
    if((_serverName.isEmpty) || (_jwtAccess.isEmpty)){
      UserSettings settings = await _repository!.getUserSettings();
      _serverName = settings.server;
      _jwtAccess = settings.jwtAccess;
      _jwtRenew = settings.jwtRenew;
    }
    _authenticationInterceptor ??= InterceptorsWrapper(
        onRequest: (request, handler) {
          if (_jwtAccess.isNotEmpty) {
            request.headers['Authorization'] = 'Bearer $_jwtAccess';
          }
          return handler.next(request);
        },
        onError: (e, handler) async {
          if (401 == e.response?.statusCode) {
            Dio? dio = await _refreshToken();
            if(null != dio){
              Map<String, dynamic> headers = e.requestOptions.headers;
              headers["Authorization"] = 'Bearer $_jwtAccess';
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);
              return handler.resolve(cloneReq);
            } else {
              _jwtAccess = '';
              _jwtRenew = '';
              UserSettings settings = await _repository!.getUserSettings();
              UserSettings newSettings = settings.copyWith(
                jwtAccess: '',
                jwtRenew: '',
              );
              await _repository!.saveUserSettings(newSettings);
              _authenticationInterceptor = null;
              try {
                NavigationHelper.navigate2AuthenticationScreen();
              } catch(error) {
                debugPrint(error.toString());
              }
            }
          } else {
            if(null != e.response) {
              handler.resolve(e.response!);
            }
          }
        },
      );
    return _authenticationInterceptor!;
  }

  static Future<Dio?> _refreshToken() async {
    Dio dio = Dio();
    //TODO: remove the next code and some another, related to the HTTP, before release
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        return true;
      };
      return null;
    };
    InterceptorsWrapper? logging = createLoggingInterceptor();
    if(null != logging){
      dio.interceptors.add(logging);
    }
    dio.options.headers.addAll({"Accept": "application/json", "ui-lang": "en_us", "pk-access-token": _jwtAccess, "pk-access-token-rn": _jwtRenew});
    final path = "$_serverName/renew"; // TODO: Check it
    Response response = await dio.post(path,
        data: {'refresh_token': _jwtRenew},
        options: Options(contentType:Headers.formUrlEncodedContentType)).catchError((e){
      return Response(statusCode: 404, statusMessage: e.toString(), requestOptions: RequestOptions(path: path));
    });
    AuthenticationResponse? refreshResponse;
    if(200 == response.statusCode){
      try{
        refreshResponse = AuthenticationResponse(response.data);
      } catch(e){
        debugPrint(e.toString());
        return null;
      }
      if(refreshResponse.isSuccessful()){
        _jwtAccess = refreshResponse.jwt!;
        _jwtRenew = refreshResponse.jwtRenew!;
        UserSettings settings = await _repository!.getUserSettings();
        UserSettings newSettings = settings.copyWith(
          jwtAccess: _jwtAccess,
          jwtRenew: _jwtRenew,
        );
        await _repository!.saveUserSettings(newSettings);
        return dio;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

