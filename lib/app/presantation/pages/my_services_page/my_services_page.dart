import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:electro_peyk/app/presantation/pages/order_page/widgets/app_bar.dart';
import 'package:electro_peyk/app/presantation/pages/order_page/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MyServicesPage extends GetView<HomeController> {
  MyServicesPage({Key? key}) : super(key: key){
    controller.getServices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5EA),
        appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Color(0xfffffffff),
            automaticallyImplyLeading: false,
            toolbarHeight: Get.height * 0.1,
            title: MyAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: body(),
        )
    );
  }
  Widget body(){
    return controller.obx((state) => LiquidPullToRefresh(
      color: Get.theme.primaryColor,
      height: 50,
      onRefresh: controller.getServices,
      child: ListView.builder(
          itemCount: controller.services.length,
          itemBuilder: (context,index){
            return OrderWidget(orderItem: controller.services[index],isService: true,);
          }),
    ),
        onLoading:Center(child: SpinKitRing(color: Get.theme.primaryColor))
    );
  }
}
