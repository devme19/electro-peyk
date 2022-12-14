import 'package:electro_peyk/app/data/models/signup_model.dart';
import 'package:electro_peyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/header_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electro_peyk/app/presantation/pages/sign_up_page/widgets/drop_down_widget.dart';
import 'package:electro_peyk/app/presantation/pages/sign_up_page/widgets/drop_down_widget.dart';
import 'package:electro_peyk/app/presantation/pages/sign_up_page/widgets/privacy_dialog.dart';
import 'package:electro_peyk/app/presantation/pages/sign_up_page/widgets/select_widget.dart';
import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({Key? key}) : super(key: key){
    if(Get.arguments != null){
      signUpModel = Get.arguments;
      isEdit = true;
      nameFamilyController.text = signUpModel!.name!;
      nationalCodeController.text = signUpModel!.nationalCode!;
    }
    controller.getCities();
  }
  bool isEdit = false;
  bool isKeyboard = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameFamilyController = TextEditingController();
  TextEditingController nationalCodeController = TextEditingController();
  SignUpModel? signUpModel = SignUpModel(isMarried: false,isMale:false,cityIndex: -1);
  @override
  Widget build(BuildContext context) {
    final focus = FocusNode();
    return SafeArea(
      child:
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:Get.theme.backgroundColor,
        body:

        Form(
          key: _formKey,
          child:
          ListView(
            children: [
              SizedBox(
                height: Get.height-35,
                child: Column(
                  children: [
                     const SizedBox(
                         height: 250,
                         child: HeaderWidget()),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              validator: (text){
                                if(text!.isEmpty){
                                  return "?????? ?? ?????? ???????????????? ???? ???????? ???????????";
                                }
                                return null;
                              },
                              onTap: () {
                              },
                              textAlign: TextAlign.start,
                              controller: nameFamilyController,
                              style: MyTextStyle().style8,
                              showCursor: false,
                              onEditingComplete: (){
                                Get.focusScope!.nextFocus();
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(

                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Color(0xff1980FF), width: 1.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Color(0xff1980FF), width: 1.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: const Color(0xffF2F2F7),
                                  hintText: "?????? ?? ?????? ????????????????",
                                  hintStyle: MyTextStyle().style12),
                            ),
                          ),
                          const SizedBox(height: 16.0,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (text){
                                if(text!.isEmpty){
                                  return "?????????? ?????? ???? ???????? ???????????";
                                }
                                return null;
                              },
                              onTap: () {
                              },
                              textAlign: TextAlign.start,
                              controller: nationalCodeController,
                              style: MyTextStyle().style8,
                              showCursor: false,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Color(0xff1980FF), width: 1.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: Color(0xff1980FF), width: 1.5),
                                      borderRadius: BorderRadius.circular(8)),
                                  fillColor: const Color(0xffF2F2F7),
                                  hintText: "???? ??????",
                                  hintStyle: MyTextStyle().style12),
                            ),
                          ),
                          const SizedBox(height: 16.0,),
                          SelectWidget(title: "??????????",value: ["??????","????"],selectedItem: genderSelectedItem,initialValue: signUpModel!.isMale),
                          const SizedBox(height: 16.0,),
                          SelectWidget(title: "?????????? ????????",value: ["??????????","????????"],selectedItem: maritalStatusSelected,initialValue: signUpModel!.isMarried),
                          const SizedBox(height: 16.0,),
                          GetBuilder<SignUpController>(builder: (controller) {
                            return DropDownWidget(
                              maxListHeight: Get.height / 2.5,
                              items: controller.cityList,
                              hintText: "???????????? ??????",
                              borderRadius: 5,
                              defaultSelectedIndex: signUpModel!.cityIndex!,
                              onChanged: (index) {
                                print("val"+index.toString());
                                signUpModel!.cityIndex = controller.cityList[index!].value!;
                                signUpModel!.city = controller.cityList[index!].title!;
                              },
                            );
                          }),
                          const SizedBox(height: 16.0,),
                          Row(
                            children: [
                              Obx(()=>Checkbox(
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  side: const BorderSide(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  value: controller.isAgree!.value,
                                  onChanged: (value) {
                                    controller.isAgree!.value = value!;
                                  }),),
                              // Text(
                              //   ".???????? ?????????? ?? ?????????? ?????????????? ???? ???????????? ?????????? ?? ???? ???????? ?????????? ???? ????????????",
                              //   style: Themes.light.textTheme.headlineLarge,
                              // ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: ".???????? ?????????? ?? ?????????? ??????????????",
                                        style: MyTextStyle().style3,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            openDialog();
                                          }),
                                    TextSpan(
                                        text:
                                        " ???? ???????????? ?????????? ?? ???? ???????? ?????????? ???? ????????????",
                                        style: MyTextStyle().style13)
                                  ]))
                            ],
                          ),
                          const SizedBox(height: 16.0,),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WarningBox(text: "?????????? ??????????: ?????? ???? ?????? ?????? ???????????? ?????? ???????? ?????????????????? ?????????? ????????????? ???????????????? ???? ???????? ???????? ???????????? ?????? ?????? ??????????????"),
                            const SizedBox(height: 16.0,),
                            Row(
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                      text: isEdit?"????????????":"?????? ??????",
                                      onPress: () {
                                        if (_formKey.currentState!.validate()) {
                                          if (controller.isAgree!.value == false) {
                                            Get.snackbar("??????",
                                                "???????? ???????????? ?????? ???? ?????????? ???? ???? ?????????? ????????",
                                                snackStyle: SnackStyle.FLOATING,
                                                colorText: Colors.redAccent);
                                            return;
                                          }
                                          else{
                                            signUpModel!.name = nameFamilyController.text;
                                            signUpModel!.nationalCode = nationalCodeController.text;
                                            Get.toNamed(AppRoutes.validationPage,arguments: signUpModel);
                                          }

                                          // if (controller.isAgree!.value &&
                                          //     controller
                                          //         .userNameController.text.isNotEmpty) {
                                          //   // Get.snackbar(
                                          //   //     "${controller.userName!.value} ???????? ",
                                          //   //     "?????? ???? ???????????? ???????? ????????",
                                          //   //     snackStyle: SnackStyle.FLOATING,
                                          //   //     colorText: const Color(0xff1980FF));
                                          //   Get.toNamed(AppRoutes.validationPage);
                                          // } else if (controller
                                          //     .userNameController.text.isEmpty) {
                                          //   Get.snackbar(
                                          //       "??????", "???????? ?????? ???????????? ?????? ???? ???????? ????????",
                                          //       snackStyle: SnackStyle.FLOATING,
                                          //       colorText: Colors.redAccent);
                                          //   return;
                                          // } else
                                          // if (controller.isAgree!.value == false) {
                                          //   Get.snackbar("??????",
                                          //       "???????? ???????????? ?????? ???? ?????????? ???? ???? ?????????? ????????",
                                          //       snackStyle: SnackStyle.FLOATING,
                                          //       colorText: Colors.redAccent);
                                          //   return;
                                          // }
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  genderSelectedItem(bool value){
    signUpModel!.isMale = value;
  }
  maritalStatusSelected(bool value){
    signUpModel!.isMarried = value;
  }

  openDialog() {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 18),
        title: "???????? ?????????? ?? ?????????? ??????????????",
        titleStyle: MyTextStyle().style11,
        content: const PrivacyDialog());
  }
}
