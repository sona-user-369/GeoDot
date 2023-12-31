import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geodot/data/services/auth_service.dart';
import 'package:geodot/utils/images.dart';
import 'package:geodot/utils/socketClient.dart';

import '../utils/colors.dart';

class BoxDrawer extends StatelessWidget {

  disconnect(context) async {
    try{
      await AuthService.logout() ;
      SocketClient socketClient = SocketClient();
      socketClient.disconnect();
      SystemNavigator.pop();
    }catch(e){
      Flushbar(
        title: 'Error',
        message: 'There was an error. Please try again !',
        duration: Duration(seconds: 3),
      ).show(context);
    }
    SocketClient socketClient = SocketClient();
    socketClient.disconnect();
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              // Your user profile section goes here
              child: Image.asset(AppImages.logo)),
          ListTile(
            title: SizedBox(
              height: 40,
              child: Container(
                  alignment: Alignment.center,
                  color: ColorPicker.success.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: SvgPicture.asset(
                        AppImages.contactLogo,
                        width: 20,
                        height: 20,
                        color: Colors.black,
                      )),
                      const Text('My contacts'),
                    ],
                  )),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'contacts');
            },
          ),
          ListTile(
            title: SizedBox(
              height: 40,
              child: Container(
                  alignment: Alignment.center,
                  color: ColorPicker.success.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: SvgPicture.asset(
                        AppImages.settingsLogo,
                        width: 20,
                        height: 20,
                        color: Colors.black,
                      )),
                      const Text('Settings'),
                    ],
                  )),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 40,
                child: Container(
                    alignment: Alignment.center,
                    color: ColorPicker.danger.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: SvgPicture.asset(
                          AppImages.settingsLogo,
                          width: 20,
                          height: 20,
                          color: Colors.black,
                        )),
                        const Text('Logout'),
                      ],
                    )),
              ),
            ),
            onTap: () async {
              await disconnect(context) ;
            },
          ),
          // Add more ListTile items for navigation
        ],
      ),
    );
  }
}
