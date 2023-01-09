
class GeneralResponse {
  static const int ok = 0;
  static const int errorAuthenticationToken = 1;
  static const int errorAuthenticationCredentials = 2;
  static const int errorAuthenticationVerificationEmail = 3;
  static const int errorAuthenticationNotFound= 4;
  static const int errorAuthenticationTokenExpired = 5;
  static const int errorAuthenticationPolicyViolation = 6;
  static const int errorRequestedObjectNotFound = 7;
  static const int errorServerUnknown = 502;
  
  int code = 0;
  String statusCode = "OK";
  String statusText = "";
  String description = "";

  GeneralResponse.error(int codeValue, String statusMessage){
    code = codeValue;
    statusText = statusMessage;
    statusCode = '';
    description = '';
  }

  GeneralResponse(Map<String, dynamic> json){
    code = json['rawStatusCode'] as int;
    statusCode = json['statusCode'] as String;
    statusText = (null == json['status']) ? '' : json['status'] as String;
    description = json['description'] as String;
  }

  bool isSuccessful(){
    if(GeneralResponse.ok == code){
      return true;
    } else {
      return false;
    }
  }
}