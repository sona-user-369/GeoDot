import 'dart:convert';

import 'package:geodot/data/services/contact_service.dart';
import 'package:get/get.dart' ;

import '../data/models/contact.dart';
import '../utils/socketClient.dart';
import 'contacts_controller.dart';

class DashBoardController extends GetxController {
  DashBoardController();

  int totalContacts = 0 ;
  int totalConnected = 0 ;

  List<UserContact> contacts = [] ;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    dynamic response= await ContactService.getTotals() ;
    List<Contact> responseContact = await ContactService.get();
    contacts = responseContact.map((e) => UserContact(contact: e, connect: e.online)).toList() ;
    totalContacts = response["total_contacts"] ;
    totalConnected = response["total_connected"] ;
    update() ;
    SocketClient socketClient = SocketClient();

    socketClient.socket.stream.listen((data){
      print(data.runtimeType);
      print(json.decode(data));
      if (data.contact_connect != null){
        var contactsMatch = contacts.where((element) => element.contact!.id == data["contact_connect"]) ;
        if(contactsMatch.isNotEmpty){
          totalConnected += 1 ;
        }
        update();
      }

      if(data["contact_disconnect"] != null){

        var contactsMatch = contacts.where((element) => element.contact!.id == data["contact_disconnect"]) ;
        if(contactsMatch.isNotEmpty){
          totalConnected -= 1 ;
        }
        update();
      }
    }) ;


  }


  reloadData() async {
    dynamic response = await ContactService.getTotals() ;
    totalContacts = response["total_contacts"] ;
    totalConnected = response["total_connected"] ;

    List<Contact> responseContact = await ContactService.get();
    contacts = responseContact.map((e) => UserContact(contact: e, connect: e.online)).toList() ;
    update();
  }



}