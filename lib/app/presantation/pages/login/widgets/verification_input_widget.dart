import 'package:electro_peyk/app/presantation/controllers/login_controller.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class VerificationInput extends StatelessWidget {
  final controller = Get.find<LoginController>();
  TextEditingController verificationController = TextEditingController();
  Function? changeFocus;
  FocusNode? textFieldFocus;
  VerificationInput(
      {Key? key,
        this.changeFocus,
        required this.verificationController,
        this.textFieldFocus})
      : super(key: key) {
  }
  String verifyCode() {
    return controller.verificationController1!.text +
        controller.verificationController2!.text +
        controller.verificationController3!.text +
        controller.verificationController4!.text +
        controller.verificationController5!.text;
  }

  @override
  Widget build(BuildContext context) {
    return
      Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        alignment: Alignment.center,
        height: 65,
        width: 65,
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          onChanged: (value) {
            if(value.length == 1){
              if(textFieldFocus == controller.focusNode1)
              {
                FocusScope.of(context).requestFocus(controller.focusNode2);
              }
              else
              if(textFieldFocus == controller.focusNode2)
              {
                FocusScope.of(context).requestFocus(controller.focusNode3);
              }
              else
              if(textFieldFocus == controller.focusNode3)
              {
                FocusScope.of(context).requestFocus(controller.focusNode4);
              }
              else
              if(textFieldFocus == controller.focusNode4)
              {
                FocusScope.of(context).requestFocus(controller.focusNode5);
              }
              else
              if(textFieldFocus == controller.focusNode5)
              {
                Get.focusScope!.unfocus();
                print(verifyCode());
              }
            }

            // if (controller.focusIndex.value > 5) {
            //   Get.focusScope!.unfocus();
            //   print(verifyCode());
            // }
          },
          focusNode: textFieldFocus,
          maxLength: 1,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          controller: verificationController,
          style: MyTextStyle().style7,
          showCursor: false,
          decoration: InputDecoration(
            counterText: "",
            enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Color(0xff1980FF), width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Color(0xff1980FF), width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            fillColor: const Color(0xffF2F2F7),
          ),
        ),
      ),
    );
  }
}