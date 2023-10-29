import 'package:geodot/data/models/contact.dart';
import 'package:geodot/data/services/contact_service.dart';
import 'package:geodot/utils/socketClient.dart';
import 'package:get/get.dart' ;

class ContactsController extends GetxController {
  ContactsController();

  bool contact = true ;

  List<UserContact> contacts = [] ;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    List<Contact> responseContact = await ContactService.get();
    contacts = responseContact.map((e) => UserContact(contact: e, connect: e.online)).toList() ;

    update() ;
    SocketClient socketClient = SocketClient();
    socketClient.socket.on('contactConnect', (data){
      var contact = contacts.where((element) => element.contact!.id == data).first ;
      contact.connect = true ;
      update();
    } ) ;
  }

  changeContactState(bool value){
    contact = value ;
    update() ;
  }
}


class UserContact {
  UserContact({
    this.contact,
    this.connect = false,
  });

  Contact? contact ;
  bool? connect ;
}