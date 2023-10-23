import 'package:flutter_secure_storage/flutter_secure_storage.dart' ;
import 'package:dio/dio.dart' ;
import 'package:geodot/data/models/contact.dart';
import 'package:geodot/data/models/user.dart';
import 'package:geodot/utils/constants.dart';
import 'package:geodot/utils/storage.dart';

class ContactService {
  static int userLogin = 0 ;
  static int userNovice = 0 ;
  static String userId =  '' ;
  static String email = '' ;

  static add(conId) async{

    var dio = Dio() ;

    String? token = await AppStorage.getToken() ;

    var response = await  dio.post(
      "${Constants.server}/contacts/add/$conId",
      options: Options(
        headers: {"Authorization": "Bearer $token"}
      )
    );

    return response ;

  }


  static confirm(contactId) async{

    var dio = Dio() ;

    String? token = await AppStorage.getToken() ;

    var response = await  dio.post(
        "${Constants.server}/contacts/confirm/$contactId",
        options: Options(
            headers: {"Authorization": "Bearer $token"}
        )
    );

    return response ;

  }


  static get() async{
    var dio = Dio() ;

    var response = await  dio.get(
        "${Constants.server}/contacts/get",
        options: Options(
            headers: {"Authorization": Constants.hashAccess}
        )
    );

    return (response.data as List).map((e) => Contact.fromJson(e)).toList();
  }

}


