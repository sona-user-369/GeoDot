import 'package:flutter/material.dart';
import 'package:geodot/controllers/contacts_controller.dart';
import 'package:get/get.dart';


class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  late ContactsController controller ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ContactsController());
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (controller){
          return const Scaffold();
        }
    );
  }
}
