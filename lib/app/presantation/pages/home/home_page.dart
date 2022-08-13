import 'dart:math';

import 'package:electro_peyk/app/presantation/controllers/home_controller.dart';
import 'package:electro_peyk/app/presantation/pages/account_page/account_page.dart';
import 'package:electro_peyk/app/presantation/pages/financial_page/financial_page.dart';
import 'package:electro_peyk/app/presantation/pages/home/widgets/bottom_navigation_items.dart';
import 'package:electro_peyk/app/presantation/pages/my_services_page/my_services_page.dart';
import 'package:electro_peyk/app/presantation/pages/order_page/order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      WillPopScope(
        onWillPop: controller.showExitPopup,
        child: Scaffold(
            backgroundColor: const Color(0xffE5E5EA),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: ()
            //   {
            //     controller.isCardAdded.value = !controller.isCardAdded.value;
            //   },
            // ),
            body:
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PageView(
                        controller: controller.pageController,
                        children: [
                          Center(
                            child: AccountPage(),
                          ),
                          Center(
                            child: FinancialPage(),
                          ),
                          Center(
                            child: MyServicesPage()
                          ),
                          OrderPage()
                        ],
                        onPageChanged: (page) {
                          controller.currentPageIndex.value = page;
                          controller.onTapBar(page);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: Get.height * 0.085,
              decoration: const BoxDecoration(color: Colors.white),
              child: Obx(
                () =>
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [



                    BottomNavigationItems(
                      selectedIndex: controller.currentPageIndex.value,
                      ontap: controller.onTapBar,
                      index: 3,
                      icon:"assets/icons/request.png",
                      title: "درخواست ها",
                    ),
                    BottomNavigationItems(
                      selectedIndex: controller.currentPageIndex.value,
                      ontap: controller.onTapBar,
                      index: 2,
                      icon: "assets/icons/myService.png",
                      title: "سرویس های من",
                    ),
                    BottomNavigationItems(
                      selectedIndex: controller.currentPageIndex.value,
                      ontap: controller.onTapBar,
                      index: 1,
                      icon: "assets/icons/financial.png",
                      title: "مالی",
                    ),
                    BottomNavigationItems(
                      selectedIndex: controller.currentPageIndex.value,
                      ontap: controller.onTapBar,
                      index: 0,
                      icon: "assets/icons/account.png",
                      title: "حساب کاربری",
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
