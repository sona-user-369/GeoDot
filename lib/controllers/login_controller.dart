import 'package:dio/dio.dart';
import 'package:get/get.dart' ;

import '../data/services/auth_service.dart';

class LoginController extends GetxController {
  LoginController();

  bool loadingState = false ;
  String? validState ;

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
      dynamic response = await AuthService.login(data);
    }catch(e){
      if(e is DioException){
        if(e.response != null ){
          validState = 'This username is already exist' ;
        }else{
          print(e);
        }
      }
    }
  }
}