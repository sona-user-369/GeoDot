import 'package:flutter/material.dart';
import 'package:geodot/controllers/register_controller.dart';
import 'package:get/get.dart' ;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  
  late RegisterController controller ;
  
  
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
          return Scaffold();
        }
    );
  }
}
