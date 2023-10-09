import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geodot/utils/images.dart';

import '../utils/colors.dart';


class BoxDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // Your user profile section goes here
            child: Image.asset(AppImages.logo)
          ),
          ListTile(
            title: SizedBox(
              height: 40,
              child: Container(
                alignment: Alignment.center,
                color: ColorPicker.success.withOpacity(0.5),
                  child: Row(
                    children: [
                      Container(child: SvgPicture.asset(AppImages.contactLogo, width: 40, height: 40, color: Colors.black,)),
                      const Text('My contacts'),
                    ],
                  )
              ),
            ),
            onTap: () {

            },
          ),
          ListTile(
            title: SizedBox(
              height: 40,
              child: Container(
                  alignment: Alignment.center,
                  color: ColorPicker.success.withOpacity(0.5),
                  child: Row(
                    children: [
                      Container(child: SvgPicture.asset(AppImages.settingsLogo, width: 40, height: 40, color: Colors.black,)),
                      const Text('Settings'),
                    ],
                  )
              ),
            ),
            onTap: () {

            },
          ),

          // Add more ListTile items for navigation
        ],
      ),
    );
  }
}
