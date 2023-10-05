import 'package:flutter_secure_storage/flutter_secure_storage.dart' ;

class Storage {

  static const String _token = 'token' ;
  static const String _loginUser = '' ;

  static FlutterSecureStorage? _preferencesInstance ;

  static FlutterSecureStorage get preferences {
    if (_preferencesInstance == null) {
      throw ("Call AppStorage.init() to initialize local storage");
    }
    return _preferencesInstance!;
  }

  static Future<void> init() async {
    _preferencesInstance = const FlutterSecureStorage();
    await initData();
  }


  static Future<void> initData() async {
    FlutterSecureStorage preferences = const FlutterSecureStorage();
    // AuthService.userLogin = preferences.getBool(_loginUser) ?? false;
    // AuthService.userId = '1' ;
  }

  static Future<String?> getToken() async {
    return await preferences.read(key: _token);
  }


  static setLoginUser(bool value)  async {
    return await  preferences.write(key:_loginUser, value:value.toString());
  }


  static setToken(String value) async{

    return await preferences.write(key:_token, value:value);
  }

}