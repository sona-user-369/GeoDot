import 'package:flutter_secure_storage/flutter_secure_storage.dart' ;
import 'package:dio/dio.dart' ;
import 'package:geodot/data/models/user.dart';
import 'package:geodot/utils/constants.dart';
import 'package:geodot/utils/storage.dart';

class AuthService {
  static int userLogin = 0 ;
  static int userNovice = 0 ;
  static String? userId =  '' ;
  static String email = '' ;

  static login(data) async{

    var dio = Dio() ;

    var formData = FormData.fromMap(data) ;

    var response = await  dio.post(
        "${Constants.server}/users/login",
        data: formData,
    );

    print(response.data);

    await AppStorage.setToken(response.data["token"]);
    await AppStorage.setLoginUser(1) ;
    await AppStorage.setIdUser(response.data["user"]["id"]) ;
    await AppStorage.setUserConId(response.data["user"]["con_id"]) ;

    userLogin = 1 ;

    return AuthenticatedUser.fromJson(response.data) ;

  }


  static register(data) async{
    var dio = Dio() ;
    var formData = FormData.fromMap(data);

    var response = await  dio.post(
        "${Constants.server}/users/register",
        data: formData,
        options: Options(
          headers: {"Authorization": Constants.hashAccess}
        )
    );

    return User.fromJson(response.data);
  }

}


