import 'package:electro_peyk/app/presantation/controllers/login_controller.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/call_widget.dart';
import 'package:electro_peyk/app/presantation/pages/login/widgets/verification_input_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/header_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends GetView<LoginController> {
  VerificationPage({Key? key}) : super(key: key);
  bool isKeyboard = false;
  @override
  Widget build(BuildContext context) {
    isKeyboard = MediaQuery.of(context).viewInsets.bottom!=0;
    return SafeArea(
      child:
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Get.theme.backgroundColor,
        body:

        
        Column(
          children: [
            const HeaderWidget(),
            // const Expanded(child: SizedBox()),
            // SizedBox(height: 60,),
            Expanded(
                flex: 4,
                child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "کد ارسال شده به شماره 09351234567 را وارد نمایید",
                            style: MyTextStyle().style10,
                          ),
                        ),
                      ),
                      Obx(
                            () =>
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: VerificationInput(
                                      textFieldFocus: controller.focusNode5,
                                      verificationController:
                                      controller.verificationController5!),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: VerificationInput(
                                      textFieldFocus: controller.focusNode4,
                                      verificationController:
                                      controller.verificationController4!),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: VerificationInput(
                                      textFieldFocus: controller.focusNode3,
                                      verificationController:
                                      controller.verificationController3!),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: VerificationInput(
                                      textFieldFocus: controller.focusNode2,
                                      verificationController:
                                      controller.verificationController2!),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: VerificationInput(
                                      textFieldFocus: controller.focusNode1,
                                      verificationController:
                                      controller.verificationController1!),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                      ),
                      !isKeyboard ?const Expanded(
                        child: SizedBox(),):Container(),
                      !isKeyboard ?
                      Row(
                        children: [
                          Expanded(
                            child: WarningBox(text:
                            "کد 5 رقمی ارسال شده به شماره موبایل خود را در کادر بالا وارد نمایید"),
                          ),
                        ],
                      )
                          : Container(),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              onPress: ontap,
                              text: "ورود / ثبت نام",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );

  }

  ontap() {
    Get.offAllNamed(AppRoutes.signUpPage);
  }
}
