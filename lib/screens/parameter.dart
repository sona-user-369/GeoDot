import 'package:flutter/material.dart';
import 'package:geodot/controllers/parameter_controller.dart';
import 'package:get/get.dart';


class ParameterPage extends StatefulWidget {
  const ParameterPage({super.key});

  @override
  State<ParameterPage> createState() => _ParameterPageState();
}

class _ParameterPageState extends State<ParameterPage> {

  late ParameterController controller ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(ParameterController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
        builder: (context) {
         return Scaffold();
        }
    );
  }
}
