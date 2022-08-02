import 'package:electro_peyk/app/presantation/pages/public_widgets/call_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      child: Column(children: [
        const CallWidget(),
        Expanded(
          flex: 2,
          child:
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top:30,
                child: Image.asset(
                  "assets/images/logoWhite.png",
                  color: Get.theme.primaryColor,
                ),
              )
              // Positioned(
              //     left: size.width * 0.25,
              //     top: size.height * 0.1 - 36,
              //     child: Image.asset(
              //       "assets/images/logoWhite.png",
              //       color: Get.theme.primaryColor,
              //     ))
            ],
          ),
        ),
      ],),
    );
  }
}
