import 'package:flutter_svg/svg.dart';
import 'package:geodot/utils/constants.dart';
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
  late DashBoardController controller;

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
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorPicker.success.withOpacity(0.5),
              title: const Text('Your GeoDot DashBoard'),
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
                      logo: SvgPicture.asset(
                        AppImages.totalLogo,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    CardDash(
                      backgroundColor: ColorPicker.warning.withOpacity(0.7),
                      title: '2',
                      subtitle: 'connected',
                      logo: SvgPicture.asset(
                        AppImages.onlineLogo,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Constants.defaultPadding,
                ),

                Container(
                  color: ColorPicker.danger,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                              color: ColorPicker.black.withOpacity(0.7),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black)),
                          child: Container(
                            // width: MediaQuery.of(context).size.width - Constants.defaultPadding,
                            height: 400,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: Container(
                              height: 400,
                              margin: EdgeInsets.only(left: 30, right: 30),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                              child: Container(
                                height: 400,
                                margin: EdgeInsets.only(left: 40, right: 40),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Container(
                                  height: 400,
                                  margin: EdgeInsets.only(left: 50, right: 50),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          // bottom: 175,
                          // left: 155,
                          child: Tooltip(
                            message: 'Me',
                              decoration: const BoxDecoration(
                                color: ColorPicker.success
                              ),
                              child: SvgPicture.asset(
                            AppImages.dot,
                            color: ColorPicker.warning,
                            width: 50,
                            height: 50,
                          ))),
                      Positioned(
                          bottom: 200,
                          left: 100,
                          child: Tooltip(
                              message: 'Tata',
                              decoration: const BoxDecoration(
                                  color: ColorPicker.success
                              ),
                              child: SvgPicture.asset(
                                AppImages.dot,
                                color: ColorPicker.warning,
                                width: 50,
                                height: 50,
                              ))),
                      Positioned(
                          bottom: 175,
                          left: 300,
                          child: Tooltip(
                              message: 'con23221212p',
                              decoration: const BoxDecoration(
                                  color: ColorPicker.success
                              ),
                              child: SvgPicture.asset(
                                AppImages.dot,
                                color: ColorPicker.warning,
                                width: 50,
                                height: 50,
                              ))),
                    ],
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
