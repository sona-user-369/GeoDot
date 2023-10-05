import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/dashboard_controller.dart';


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  late DashBoardController controller ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(DashBoardController());
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
