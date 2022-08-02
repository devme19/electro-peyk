import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:electro_peyk/app/presantation/pages/account_detail_page/account_detail_page.dart';
import 'package:electro_peyk/app/presantation/pages/account_page/widgets/account_page_widget.dart';
import 'package:electro_peyk/app/presantation/pages/support_page/support_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AccountPage extends GetView<HomeController> {
  AccountPage({Key? key}) : super(key: key){
    print("s");
  }


  @override
  Widget build(BuildContext context) {
    return
      Obx(()=> body()
      );
  }
  Widget body(){
    switch(controller.accountPageWidgetIndex.value){
      case -1:
        return AccountPageWidget(onDetailTap:controller.onAccountTap,onSupportTap: controller.onSupportTap,);
      case 0:
        return AccountDetailPage(onTap: controller.onBackPress,);
      case 1:
        return SupportPage(onBack: controller.onBackPress,);
      default:return Container();
    }
  }

}
