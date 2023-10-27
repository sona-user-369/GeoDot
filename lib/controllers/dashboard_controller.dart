import 'package:geodot/data/services/contact_service.dart';
import 'package:get/get.dart' ;

class DashBoardController extends GetxController {
  DashBoardController();

  int totalContacts = 0 ;
  int totalConnected = 0 ;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    dynamic response= await ContactService.getTotals() ;
    totalContacts = response["total_contacts"] ;
    totalConnected = response["total_connected"] ;
    update() ;
  }


  reloadData() async {
    dynamic response = await ContactService.getTotals() ;
    totalContacts = response["total_contacts"] ;
    totalConnected = response["total_connected"] ;
    update();
  }



}