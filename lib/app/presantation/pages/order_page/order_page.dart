import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:electro_peyk/app/presantation/pages/order_page/widgets/order_widget.dart';
import 'package:electro_peyk/app/presantation/pages/order_page/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class OrderPage extends GetView<HomeController> {
  OrderPage({Key? key}) : super(key: key){
    controller.getOrders();
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
    return controller.obx((state) =>
        LiquidPullToRefresh(
          height: 50,
          color: Get.theme.primaryColor,
          onRefresh: controller.getOrders,
          child: ListView.builder(
      itemCount: controller.orders.length,
          itemBuilder: (context,index){
            return OrderWidget(orderItem: controller.orders[index],);
          }),
        ),
      onLoading:Center(child: SpinKitRing(color: Get.theme.primaryColor))
    );
  }
}
