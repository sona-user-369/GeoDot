import 'package:dio/dio.dart';
import 'package:geodot/utils/storage.dart';
import 'package:get/get.dart' ;

import '../data/services/auth_service.dart';

class LoginController extends GetxController {
  LoginController();

  bool loadingState = false ;
  String? validState ;
  bool connectivity = true ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeLoadingState(bool value){
    loadingState = value ;
    update();
  }

  sendLogin(data) async {
    try{
      await AuthService.login(data);
    }catch(e){
      if(e is DioException){
        if(e.response != null ){
          connectivity = true ;
          validState = 'your username or password is incorrect' ;
        }else{
          print(e);
          connectivity = false ;
        }
      }
      update();
      return false ;
    }

    update();
    return true ;
  }



}