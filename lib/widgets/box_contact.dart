import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geodot/utils/images.dart';

import '../utils/colors.dart';

class BoxContact extends StatelessWidget {
  const BoxContact({
    super.key,
    required this.label,
    required this.image,
    this.online,
    this.request = false,
  });

  final String label ;
  final String image ;
  final bool? online ;
  final bool request ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                      child: SvgPicture.asset(image, fit: BoxFit.cover,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(label),
                )
              ],
            ),
          ),
          
           !request ? SvgPicture.asset(AppImages.dot, color: online! ? ColorPicker.warning: ColorPicker.danger,width: 50, height: 50,)
          :
               IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.acceptLogo, color: ColorPicker.success,))
        ],
      ),
    );
  }
}
