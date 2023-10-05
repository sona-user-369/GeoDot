import 'package:flutter/material.dart';
import 'package:geodot/controllers/add_contact_controller.dart';
import 'package:get/get.dart';



class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

  late AddContactController controller ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AddContactController()) ;
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
