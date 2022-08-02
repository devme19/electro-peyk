import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/header_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electro_peyk/app/presantation/pages/validation_page/row_item_widget.dart';
import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ValidationPage extends StatelessWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          backgroundColor:Get.theme.backgroundColor,
          body: SizedBox(
            height: Get.height - 25,
            child: ListView(children:[
              HeaderWidget(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RowItemWidget(title: "متخصص گرامی:",value: "محمد توتونچی",),
                    RowItemWidget(title: "کدملی:",value: "4600215486",),
                    RowItemWidget(title: "جنسیت:",value: "مرد",),
                    RowItemWidget(title: "وضعیت تاهل:",value: "متاهل",),
                    RowItemWidget(title: "شهر:",value: "تهران",),
                    RowItemWidget(title: "وضعیت بررسی:",value: "درحال بررسی",color: Colors.yellow),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    WarningBox(text: "مشخصات شما توسط کارشناسان ما در حال بررسی است در صورت تایید شدن مشخصات شما، به حساب کاربری خود منتقل خواهید شد"),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Expanded(child: ButtonWidget(text: "ویرایش مشخصات",onPress: (){},)),
                      ],
                    ),
                    SizedBox(height: 8.0,),
                    Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: ()=>Get.toNamed(AppRoutes.homePage),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(BUTTON_RADIUS),
                              color: Colors.white,
                            ),
                            child: Center(child: Text("خروج از حساب",style: TextStyle(color: Colors.red,fontSize: 14))),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),

            ],),
          ),
        )
    );
  }
}
