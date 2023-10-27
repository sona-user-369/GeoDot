import 'package:dio/dio.dart';
import 'package:get/get.dart' ;

import '../data/services/contact_service.dart';

class AddContactController extends GetxController {
  AddContactController();


  bool haveError = false ;
  bool loadingState = false ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeLoadState(bool value){
    loadingState = value ;
    update() ;
  }

  requestAdd(String conId) async {
    try {
      await ContactService.add(conId) ;
    }catch(e){
       if(e is DioException){
         if(e.response != null){
           print(e);
         }else{
           haveError = true ;
         }
       }
    }
  }

}