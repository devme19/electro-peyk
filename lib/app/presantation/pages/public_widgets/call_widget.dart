import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CallWidget extends StatelessWidget {
  const CallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(15))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1564",
            style: MyTextStyle().style5,
          ),
          Image.asset("assets/icons/call.png",color: Get.theme.primaryColor,)
        ],
      ),
    );
  }
}
