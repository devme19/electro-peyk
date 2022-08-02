import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:electro_peyk/app/presantation/pages/financial_page/widgets/add_card_widget.dart';
import 'package:electro_peyk/app/presantation/pages/financial_page/widgets/bank_info_widget.dart';
import 'package:electro_peyk/app/presantation/pages/financial_page/widgets/income_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class FinancialPage extends GetView<HomeController> {
  FinancialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body:
      Obx(()=>body()
          ),
    ));
  }
  Widget body(){
    if(controller.isModifyBankInfo.value) {
      return BankInfoWidget(back: back,modify: modify,);
    }
    if(controller.addCard.value){
      return AddCardWidget(back: back,);
    }
    return IncomeWidget(isCardAdded: controller.isCardAdded.value,addCard: addCard,);
  }
  modify(bool value){
    controller.isModifyBankInfo.value = false;
    controller.addCard.value = true;
  }
  back(bool value){
    controller.isModifyBankInfo.value = false;
    controller.addCard.value = false;
  }
  addCard(bool add){
    if(add){
      controller.addCard.value = true;
    }else{
      controller.isModifyBankInfo.value = true;
    }
  }
}
