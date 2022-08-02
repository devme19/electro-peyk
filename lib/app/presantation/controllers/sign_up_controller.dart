import 'package:electro_peyk/app/presantation/pages/sign_up_page/widgets/drop_down_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool? dropDown = false.obs;
  RxBool? isAgree = false.obs;
  RxDouble? height = 0.0.obs;
  RxBool? warningVisible = true.obs;
  RxString? selectedCity = "شهر خود را انتخاب کنید".obs;
  TextEditingController userNameController = TextEditingController();
  RxString? userName = "".obs;
  RxInt selectedIndex = (-1).obs;
  List<CustDropdownMenuItem> cityList=[];
  final cityList0 = <String>[
    "تهران",
    "اصفهان",
    "البرز",
    "تبریز",
    "شیراز",
    "مشهد",
    "ارومیه",
    "اهواز"
  ];
  getCities(){
    cityList.clear();
    for(int i=0;i<cityList0.length;i++) {
      cityList.add(CustDropdownMenuItem(title: cityList0[i],value: i.toString(),));
    }
    update();
  }
  @override
  void onInit() {
    super.onInit();

  }
}
