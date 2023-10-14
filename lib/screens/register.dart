import 'package:flutter/material.dart';
import 'package:geodot/controllers/register_controller.dart';
import 'package:geodot/utils/colors.dart';
import 'package:geodot/utils/constants.dart';
import 'package:get/get.dart' ;

import '../utils/images.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  
  late RegisterController controller ;
  final _formKey = GlobalKey<FormState>() ;
  var usernameController = TextEditingController() ;
  var passwordController = TextEditingController() ;
  var confirmPasswordController = TextEditingController() ;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(RegisterController());
  }
  
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (controller){
          return Scaffold(
            body: Wrap(
              children: [
                SizedBox(
                  height: 300,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(AppImages.logo, width: 100, height: 100,),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Username :',
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

                      SizedBox(height: Constants.defaultPadding,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Password :',
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

                      SizedBox(height: Constants.defaultPadding,),

                      Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text('Vous n\'avez pas un compte ?'),
                        ),
                      ),
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPicker.success,
                          fixedSize: Size(160, 40)
                        ),
                          onPressed: (){
                            Navigator.pushNamed(context, 'dashboard');
                          },
                          child: const Text(
                              'Register',
                            style: TextStyle(
                              color: ColorPicker.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17
                            ),
                          )
                      ),


                    ],
                  )
                )
              ],
            ),
          );
        }
    );
  }
}
