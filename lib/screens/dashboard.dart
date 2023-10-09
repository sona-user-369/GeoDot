import 'package:flutter_svg/svg.dart';
import 'package:geodot/widgets/box_card_dash.dart';
import 'package:geodot/widgets/box_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/dashboard_controller.dart';
import '../utils/colors.dart';
import '../utils/images.dart';


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
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorPicker.success.withOpacity(0.5),
                  title: Text('Your GeoDot DashBoard'),
                ),
                drawer: BoxDrawer(),
               body: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       CardDash(
                         backgroundColor: ColorPicker.primary.withOpacity(0.4),
                         title: '4',
                         subtitle: 'total',
                         logo: SvgPicture.asset(AppImages.totalLogo, width: 30, height: 30,),
                       ),
                       CardDash(
                         backgroundColor: ColorPicker.warning.withOpacity(0.7),
                         title: '2',
                         subtitle: 'connected',
                         logo: SvgPicture.asset(AppImages.onlineLogo, width: 30, height: 30,),
                       ),
                     ],
                   )
                 ],
               ),
              )
          );
        }
    );
  }
}
