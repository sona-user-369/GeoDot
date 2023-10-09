import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geodot/utils/colors.dart';
import 'package:geodot/utils/images.dart';

class CardDash extends StatelessWidget {
  const CardDash({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.logo,
  });

  final Color backgroundColor ;
  final String title ;
  final String subtitle ;
  final Widget logo ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 150,
      height: 150,
      child: Card(
        color: backgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: logo
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child:  Text(
                          title,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'contacts',
                        style: TextStyle(

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          subtitle,
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
