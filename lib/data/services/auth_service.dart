import 'package:flutter_secure_storage/flutter_secure_storage.dart' ;


class AuthService {
  static int userLogin = 0 ;
  static String userId =  '' ;
  static String email = '' ;

  static login() async{
    var prefs = const FlutterSecureStorage() ;
    prefs.write(key: 'token', value: '1') ;
    userLogin = 1 ;

  }
}