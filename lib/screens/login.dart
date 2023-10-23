import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geodot/controllers/login_controller.dart';
import 'package:geodot/utils/images.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginController controller ;
  final _formKey = GlobalKey<FormState>() ;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController() ;

  bool hide = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(LoginController());
  }

  submit(data, context) async {
    if((!_formKey.currentState!.validate() && controller.validState != null) || _formKey.currentState!.validate()) {
      controller.changeLoadingState(true);
      if (await controller.sendLogin(data)) {
        Navigator.pushNamed(context, 'dashboard');
        Flushbar(
          title:  "Welcome",
          message:  "You're are welcome beyond geodot users !",
          duration:  const Duration(seconds: 3),
        ).show(context);
      }
      controller.changeLoadingState(false);
      if(!controller.connectivity){
        Flushbar(
          title:  "Error",
          message:  "Unable to connect to the remote server",
          duration:  const Duration(seconds: 3),
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (controller){
          return  SafeArea(
            child: Scaffold(
                body: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        color: ColorPicker.success.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/2-50,
                      alignment: Alignment(-0.5, 0.1),
                      decoration: const BoxDecoration(
                        color: ColorPicker.white,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(350)),
                        // border: Border(bottom: BorderSide(color: ColorPicker.success))
                      ),
                      child: SizedBox(
                        width: 200,
                          height: 200,
                          child: Image.asset(AppImages.logo),
                      ),
                    ),
                    Positioned(
                      bottom: 2*Constants.defaultPadding,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
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
                                      controller: usernameController,
                                      validator: (value){
                                        if(value == null || value == ''){
                                          return 'Champ requis';
                                        }
                                        return controller.validState ;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorPicker.white,
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
                                      controller: passwordController,
                                      validator: (value){
                                        if(value == null || value == ''){
                                          return 'Champ requis';
                                        }
                                        return controller.validState ;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ColorPicker.white,
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              hide=!hide ;
                                            });
                                          },
                                          icon: hide ? SvgPicture.asset('assets/logos/hide.svg', color: ColorPicker.dark,)
                                              : SvgPicture.asset("assets/logos/show.svg", color: ColorPicker.dark,),
                                        ),
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

                                  // SizedBox(height: Constants.defaultPadding,),

                                  Container(
                                    alignment: Alignment.topRight,
                                    child: TextButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, 'login');
                                      },
                                      child: const Text('Are you new here ?'),
                                    ),
                                  ),

                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorPicker.success,
                                          fixedSize: Size(160, 40)
                                      ),
                                      onPressed: () async{
                                        var data = {
                                          "username": usernameController.text,
                                          "password": passwordController.text,
                                        } ;
                                        await submit(data, context) ;
                                      },
                                      child: !controller.loadingState ? const Text(
                                        'Login',
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
                        )
                      ),
                    )

                  ],
                ),
            ),
          );
        }
    );
  }
}


class ConvexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height/2);
    // path.lineTo(0, size.height);

    path.quadraticBezierTo(0, 79, 0, 0); // Courbe concave vers le coin inférieur droit
    // path.lineTo(0, 0); // Ligne jusqu'au coin supérieur droit
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
