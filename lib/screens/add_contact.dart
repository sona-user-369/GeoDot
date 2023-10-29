import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:geodot/controllers/add_contact_controller.dart';
import 'package:geodot/utils/storage.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/box_drawer.dart';



class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {

  late AddContactController controller ;
  var _formKey = GlobalKey<FormState>() ;
  var conIdController = TextEditingController() ;
  var nameController = TextEditingController() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AddContactController()) ;
  }


  submit(Map data, context) async {
    if(_formKey.currentState!.validate()){
      controller.changeLoadState(true) ;
      await controller.requestAdd(data["conId"]);
      if(controller.haveError){
         Flushbar(
          title: 'Error',
          message: 'We encountered an error to send request to this user',
          duration: const Duration(seconds: 3),
        ).show(context);
      }else{
        await AppStorage.setKindlyName(data["conId"], data["name"]);
      }
      controller.changeLoadState(false) ;
    }

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (controller){
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPicker.success.withOpacity(0.5),
              title: Text('Add a contact'),
            ),
              drawer: BoxDrawer(),
            body:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Id con of contact :',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: conIdController,
                            validator: (value){
                              if(value == '' || value == null){
                                return 'This field is required' ;
                              }
                              return null ;
                            },
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
                                  borderSide: BorderSide(
                                    color: ColorPicker.danger,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorPicker.danger,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: Constants.defaultPadding,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Kindly name (Optional) :',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
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
                            ),
                          ),
                        ),

                        const SizedBox(height: Constants.defaultPadding,),

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPicker.success,
                                fixedSize: Size(180, 40)
                            ),
                            onPressed: () async {
                              var data = {
                                "conId": conIdController.text ,
                                "name":nameController.text
                              };
                              await submit(data, context) ;
                            },
                            child: !controller.loadingState ? const Text(
                              'Send request',
                              style: TextStyle(
                                  color: ColorPicker.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17
                              ),
                            ):
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: ColorPicker.white,
                                strokeWidth: 3,
                                backgroundColor: ColorPicker.white.withOpacity(0.7),
                              ),
                            )
                        ),


                      ],
                    ),
                  )
              ),
            )
          );
        }
    );
  }
}
