import 'package:geodot/data/models/contact.dart';
import 'package:geodot/data/services/contact_service.dart';
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
    contacts = responseContact.map((e) => UserContact(contact: e, connect: false)).toList() ;

    update() ;
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

  final Contact? contact ;
  final bool? connect ;
}