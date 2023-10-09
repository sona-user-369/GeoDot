import 'package:flutter/material.dart';
import 'package:geodot/controllers/login_controller.dart';
import 'package:geodot/utils/images.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (controller){
          return  Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(AppImages.logo),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(MediaQuery.of(context).size.width, -3)
                          ),
                          border: Border.all(color: Colors.green)
                        ),
                        child: const Column(

                        ) ,
                      ),
                    ),
                  )

                ],
              ),
          );
        }
    );
  }
}
