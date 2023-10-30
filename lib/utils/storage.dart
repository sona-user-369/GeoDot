import 'package:flutter_secure_storage/flutter_secure_storage.dart' ;

import '../data/services/auth_service.dart';

class AppStorage {

  static const String _token = 'token' ;
  static const String _loginUser = 'userLogin' ;
  static const String _userId = 'userId' ;
  static const String _userConId = 'userConId' ;

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
    AuthService.userLogin = int.parse(await preferences.read(key : _loginUser) ?? '0');
    print(AuthService.userLogin);
    AuthService.userNovice = await preferences.read(key: _token) == null ? 1: 0 ;
    print(AuthService.userNovice);
    AuthService.userId = await preferences.read(key: _userId) ;
  }

  static Future<String?> getToken() async {
    return await preferences.read(key: _token);
  }


  static Future<String?> getUserId() async {
    return await preferences.read(key: _userId);
  }


  static Future<String?> getUserConId() async {
    return await preferences.read(key: _userConId);
  }


  static Future<String> getKindlyName(conId) async {
    return await preferences.read(key: conId) ?? conId;
  }


  static setLoginUser(int value)  async {
    return await preferences.write(key:_loginUser, value:value.toString());
  }


  static setToken(String value) async{

    return await preferences.write(key:_token, value:value);
  }

  static setIdUser(String value) async {

    return await preferences.write(key: _userId, value: value) ;
  }

  static setUserConId(String value) async {

    return await preferences.write(key: _userConId, value: value) ;
  }

  static setKindlyName(String conId, String value) async {
    return await preferences.write(key: conId, value: value);
  }


}