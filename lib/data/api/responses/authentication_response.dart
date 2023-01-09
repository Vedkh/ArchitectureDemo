import 'package:archdemo/data/api/responses/general_response.dart';
import 'package:archdemo/data/entities/common/user.dart';


class AuthenticationResponse extends GeneralResponse {
  String? jwt;
  String? jwtRenew;
  User? user;

  AuthenticationResponse.error(int code, String statusMessage) : super.error(code, statusMessage);

  AuthenticationResponse(Map<String, dynamic> json) : super(json) {
    jwt = json['jwt'];
    jwtRenew = json['jwtRenew'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

