import 'package:get/get.dart' ;

class RegisterController extends GetxController {
  RegisterController();

  bool loadingState = false ;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeLoadingState(bool value){
    loadingState = value ;
    update();
  }

}