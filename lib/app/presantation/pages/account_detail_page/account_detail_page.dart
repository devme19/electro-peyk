import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AccountDetailPage extends StatefulWidget {
  AccountDetailPage({Key? key,this.onTap}) : super(key: key);
  Function()? onTap;
  @override
  State<AccountDetailPage> createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height*0.25,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: Get.height*0.125,
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  widget.onTap!();
                                },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.arrow_back_ios,color: Colors.white,),
                                        Text("حساب کاربری‍",style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          Positioned(
                            top:Get.height*0.125-Get.width*0.33/2,
                            right: 16.0,
                            child: Container(
                              height: Get.width*0.33,
                              margin: const EdgeInsets.only(right: 16.0),
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
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("09124887596",style: Get.theme.textTheme.subtitle2),
                          Text("شماره تلفن",style: Get.theme.textTheme.subtitle1),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2181849578",style: Get.theme.textTheme.subtitle2),
                          Text("کدملی",style: Get.theme.textTheme.subtitle1),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:2,child: TextField(
                              onEditingComplete: (){
                                Get.focusScope!.nextFocus();
                              },
                              style: Get.theme.textTheme.subtitle2)),

                          Expanded(child: Text("نام و نام خانوادگی",style: Get.theme.textTheme.subtitle1,textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:2,child: TextField(
                              onEditingComplete: (){
                                Get.focusScope!.nextFocus();
                              },
                              keyboardType: TextInputType.emailAddress,style: Get.theme.textTheme.subtitle2)),

                          Expanded(child: Text("ایمیل",style: Get.theme.textTheme.subtitle1,textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:2,child:
                          Row(
                            children: [
                              Expanded(child: SizedBox(
                                height:60,
                                  child: TextField(
                                    onEditingComplete: (){
                                      Get.focusScope!.nextFocus();
                                    },
                                      decoration: const InputDecoration(
                                          counterText: ""
                                      ),
                                      maxLength:4,keyboardType: TextInputType.number,style: Get.theme.textTheme.subtitle2,textAlign: TextAlign.center,))),
                              const SizedBox(width: 8.0,),
                              Expanded(child: SizedBox(height:60,child: TextField(
                                  onEditingComplete: (){
                                    Get.focusScope!.nextFocus();
                                  },
                                  decoration: const InputDecoration(
                                      counterText: ""
                                  ),
                                  maxLength:2,keyboardType: TextInputType.number,style: Get.theme.textTheme.subtitle2,textAlign: TextAlign.center))),
                              const SizedBox(width: 8.0,),
                              Expanded(child: SizedBox(height:60.0,child: TextField(
                                  onEditingComplete: (){
                                    Get.focusScope!.nextFocus();
                                  },
                                  decoration: const InputDecoration(
                                      counterText: ""
                                  ),
                                  maxLength:2,keyboardType: TextInputType.number,style: Get.theme.textTheme.subtitle2,textAlign: TextAlign.center))),
                            ],
                          )),

                          Expanded(child: Text("تاریخ تولد",style: Get.theme.textTheme.subtitle1,textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:2,child:
                          Row(
                            children: [
                              Expanded(child: InkWell(
                                onTap: ()=>setState(() {
                                  isMale = false;
                                }),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color:!isMale? Get.theme.primaryColor:Get.theme.primaryColor.withOpacity(0.3))
                                  ),
                                  child: Center(child: Text("زن",style:!isMale? Get.theme.textTheme.bodyText1:Get.theme.textTheme.bodyText2),),
                                ),
                              )),
                              const SizedBox(width: 8.0,),
                              Expanded(child:

                              InkWell(
                                onTap: ()=>setState(() {
                                  isMale =true;
                                }),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: isMale?Get.theme.primaryColor:Get.theme.primaryColor.withOpacity(0.3))
                                  ),
                                  child: Center(child: Text("مرد",style:isMale? Get.theme.textTheme.bodyText1:Get.theme.textTheme.bodyText2),),
                                ),
                              )),
                              const SizedBox(width: 8.0,),
                              Expanded(child: Container()),
                            ],
                          )),

                          Expanded(child: Text("جنسیت",style: Get.theme.textTheme.subtitle1,textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex:2,child: Row(
                            children: [
                              Expanded(flex:2,child: ButtonWidget(onPress: (){}, text: "ثبت درخواست")),
                              Expanded(child: Container(),)
                            ],
                          )),

                          Expanded(child: Text("درخواست تغییر اطلاعات",style: Get.theme.textTheme.subtitle1,textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    const Divider(),
                    Container(
                      height: 70.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("خروج از حساب کاربری",style: TextStyle(fontFamily:"Vazir",color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],),
          ),
        ),
      ],
    );
  }
}
