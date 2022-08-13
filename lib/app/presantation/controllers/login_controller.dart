import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController? verificationController1 = TextEditingController();
  TextEditingController? verificationController2 = TextEditingController();
  TextEditingController? verificationController3 = TextEditingController();
  TextEditingController? verificationController4 = TextEditingController();
  TextEditingController? verificationController5 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  RxInt focusIndex = 1.obs;

  RxBool warningTextVisible = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(warningTextVisible.value);
  }

  FocusNode texFieldFocus = FocusNode();
  getCode()async{
   await Future.delayed(const Duration(seconds: 1));
   verificationController1!.text= "4";
   verificationController2!.text= "1";
   verificationController3!.text= "7";
   verificationController4!.text= "9";
   verificationController5!.text= "2";
   await Future.delayed(const Duration(seconds: 1));
   Get.offAllNamed(AppRoutes.signUpPage);
  }
}
