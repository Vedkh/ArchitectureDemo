import 'dart:io';
import 'package:archdemo/data/entities/user_settings.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dio_interceptors_factory.dart';


class DemoApi {
  static const String serverUrl = "http://192.168.92.167:8090";
  static const String apiPath = "/api/v1";
  late String jwt;
  late String jwtRenew;
  late String languageCode;
  late String server;
  late Dio dio;

  String get imagesRoot => "$server/pokatun/images/".replaceAll("api/v1/", "");

  static Future<DemoApi> fromSettings(UserSettings settings) async {
    DemoApi api = DemoApi();
    api.languageCode = settings.languageCode;
    api.server = settings.server;
    api.jwt = settings.jwtAccess;
    api.jwtRenew = settings.jwtRenew;
    await api._initializeDio();
    return api;
  }

  Future<void> _initializeDio() async {
    dio = Dio();

    //TODO: remove the next code and some another, related to the HTTP, before release
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback=(X509Certificate cert, String host, int port){
        return true;
      };
      return null;
    };
    // end of the code to remove

    InterceptorsWrapper? loggingInterceptor = DioInterceptorsFactory.createLoggingInterceptor();
    if(null != loggingInterceptor) {
      dio.interceptors.add(loggingInterceptor);
    }
    dio.interceptors.add(await DioInterceptorsFactory.createAuthenticationInterceptor());
    dio.options.headers.addAll({"ui-lang": languageCode});
    if(jwt.isNotEmpty){
      dio.options.headers.addAll({"pk-access-token": jwt});
    }
  }
}