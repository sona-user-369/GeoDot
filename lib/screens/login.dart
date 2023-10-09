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
                      child: ClipPath(
                        clipper: ConvexClipper(),
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
                    ),
                  )

                ],
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
