import 'package:electro_peyk/app/presantation/controllers/login_controller.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/call_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/header_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  bool isKeyboard = false;
  TextEditingController phoneNumberController = TextEditingController();
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
            Expanded(
              flex: 4,
              child:
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // SizedBox(height: Get.height*0.2),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        onSubmitted: (value) {

                        },
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        controller: phoneNumberController,
                        style: MyTextStyle().style9,
                        showCursor: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Get.theme.primaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Get.theme.primaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(8)),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Get.theme.primaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(8)),
                          fillColor: const Color(0xffF2F2F7),
                          labelStyle: MyTextStyle().style8,
                          labelText: "شماره موبایل",
                        ),
                      ),
                    ),
                    !isKeyboard?const Expanded(child: SizedBox(),):Container(),
                    !isKeyboard?
                    Row(
                      children: [
                        Expanded(
                          child: WarningBox(
                              text:
                              "برای وارد شدن به حساب کاربری و یا ثبت نام کردن در برنامه از شماره موبایل خود استفاده نمایید"),
                        ),
                      ],
                    ):Container(),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                              text: "ورود / ثبت نام",
                              onPress: () {
                                ontap();
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  ontap() {
    Get.toNamed(AppRoutes.verificationPage);
  }
}
