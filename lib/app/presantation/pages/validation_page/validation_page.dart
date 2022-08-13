import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/header_widget.dart';
import 'package:electro_peyk/app/presantation/pages/public_widgets/warning_box.dart';
import 'package:electro_peyk/app/presantation/pages/validation_page/row_item_widget.dart';
import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/signup_model.dart';
class ValidationPage extends StatelessWidget {
  ValidationPage({Key? key}) : super(key: key){
    signUpModel = Get.arguments;
  }
  SignUpModel signUpModel = SignUpModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          backgroundColor:Get.theme.backgroundColor,
          body: ListView(children:[
            SizedBox(
              height: Get.height-35,
              child: Column(
                children: [
                  HeaderWidget(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        RowItemWidget(title: "متخصص گرامی:",value: signUpModel.name,),
                        RowItemWidget(title: "کدملی:",value: signUpModel.nationalCode,),
                        RowItemWidget(title: "جنسیت:",value: signUpModel.isMale!?"مرد":"زن",),
                        RowItemWidget(title: "وضعیت تاهل:",value:signUpModel.isMarried!? "متاهل":"مجرد",),
                        RowItemWidget(title: "شهر:",value: signUpModel.city,),
                        RowItemWidget(title: "وضعیت بررسی:",value: "درحال بررسی",color: Colors.yellow),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WarningBox(text: "مشخصات شما توسط کارشناسان ما در حال بررسی است در صورت تایید شدن مشخصات شما، به حساب کاربری خود منتقل خواهید شد"),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(child: ButtonWidget(text: "ویرایش مشخصات",onPress: (){
                                Get.offAllNamed(AppRoutes.signUpPage,arguments: signUpModel);
                              },)),
                            ],
                          ),
                          SizedBox(height: 8.0,),
                          Row(
                            children: [
                              Expanded(child: InkWell(
                                onTap: ()=>Get.offAllNamed(AppRoutes.homePage),
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
                  ),
                ],
              ),
            ),

          ],),
        )
    );
  }
}
