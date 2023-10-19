import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:geodot/data/services/auth_service.dart';
import 'package:get/get.dart' ;

class RegisterController extends GetxController {
  RegisterController();

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


   sendRegister(data) async {
    try{
     await AuthService.register(data);
     validState = null ;
    }catch(e){
      if(e is DioException){
        if(e.response != null ){
           validState = 'This username is already exist' ;
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

  verifyMatchCredentials(oldDis, newDis){
    return oldDis != newDis ? false: true;
  }

}