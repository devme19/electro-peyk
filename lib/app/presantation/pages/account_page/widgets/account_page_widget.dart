import 'package:electro_peyk/app/presantation/pages/financial_page/widgets/box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AccountPageWidget extends StatelessWidget {
  Function()? onDetailTap;
  Function()? onSupportTap;
  AccountPageWidget({Key? key,this.onDetailTap,this.onSupportTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: SizedBox(
                  height: Get.height*0.28,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: Get.height*0.14,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: Get.width*0.33,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/user.png",fit: BoxFit.cover),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(child: BoxWidget(title: "امتیاز شما", value: "0")),
                          const SizedBox(width: 16.0,),
                          Expanded(child: BoxWidget(title: "سرویس های موفق", value: "0")),
                          const SizedBox(width: 16.0,),
                          Expanded(child: BoxWidget(title: "روز در الکتروپیک", value: "0"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 1),
              InkWell(
                  onTap: (){
                    onDetailTap!();
                  },
                  child: menuItem("حساب کاربری",Image.asset("assets/icons/account.png"))),
              Container(height: 1),
              menuItem("اپلیکیشن مشتریان",Image.asset("assets/icons/application.png")),
              Container(height: 1),
              InkWell(
                onTap: ()=>onSupportTap!(),
                  child: menuItem("پشتیبانی",Image.asset("assets/icons/support.png"))),
              Container(height: 1),
              menuItem("قوانین و شرایط استفاده",Image.asset("assets/icons/rules.png")),
              Container(height: 1),
            ],),
          ),
        ),
      ],
    );
  }
  Widget menuItem(String title,Image icon){
    return
      Container(
        height: 100,
        padding: const EdgeInsets.only(right: 16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,style: const TextStyle(fontSize: 16,color: Colors.black)),
            const SizedBox(width: 10.0,),
            icon
          ],
        ),
      );
  }
}
