import 'package:flutter/material.dart';
import 'package:geodot/controllers/contacts_controller.dart';
import 'package:geodot/utils/constants.dart';
import 'package:geodot/widgets/box_contact.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import '../widgets/box_drawer.dart';


class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  late ContactsController controller ;
  var searchController = TextEditingController() ;


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
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     keyboardType: TextInputType.text,
                     controller: searchController,
                     decoration: InputDecoration(
                       // filled: true,
                       fillColor: ColorPicker.dark.withOpacity(0.2),
                       border: InputBorder.none,
                       enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                               color: ColorPicker.dark.withOpacity(0.2),
                               width: 3
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: ColorPicker.success,
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),

                       errorBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: ColorPicker.danger,
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       focusedErrorBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: ColorPicker.danger,
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       prefixIcon: const Icon(
                         Icons.search
                       )
                     ),
                   ),
                 ),
                 SizedBox(height: Constants.defaultPadding,),
                 const SizedBox(
                   child: SingleChildScrollView(
                     child: Column(
                       children: [
                         BoxContact(
                           label: 'con23221212p',
                           image: AppImages.personMan,
                           online: true,
                         ),
                         BoxContact(
                           label: 'Tata',
                           image: AppImages.personMan,
                           online: true,
                         ),
                         BoxContact(
                           label: 'Gérard',
                           image: AppImages.personMan,
                           online: false,
                         )
                       ],
                     ),
                   ),
                 )
               ],
            )
          );
        }
    );
  }
}
