import 'package:flutter/material.dart';
import 'package:geodot/controllers/contacts_controller.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../widgets/box_drawer.dart';


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
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPicker.success.withOpacity(0.5),
              title: Text('My contacts'),
            ),
              drawer: BoxDrawer(),
            body:  Column(

            ),
          );
        }
    );
  }
}
