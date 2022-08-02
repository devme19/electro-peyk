import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BankInfoWidget extends StatelessWidget {
  ValueChanged<bool>? back;
  ValueChanged<bool>? modify;
  BankInfoWidget({Key? key,this.back,this.modify}) : super(key: key);
  var formatter = NumberFormat('#,###,000');
  int status =1;
  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: Get.height/5,

                child: Stack(
                  children: [
                    Container(
                      height: Get.height/10,
                      color: Get.theme.primaryColor,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
                        onPressed: ()=>back!(true),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 160,
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
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("5022 2910 9200 0000",style: TextStyle(fontSize: 16,color: Colors.green)),
                ],
              ),
              const SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("بانک پاسارگاد",style: TextStyle(fontSize: 16)),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("IR 020124456632002130",style: TextStyle(fontSize: 16,color: Colors.black)),
                    Text("شبا",style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getStatus(status),
                    const Text("وضعیت",style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Get.theme.primaryColor.withOpacity(0.1),
                            border: Border.all(color:Get.theme.primaryColor)
                        ),
                        child: Center(child: Text("تغییر",style: TextStyle(fontSize: 16,color:status != 2?Get.theme.primaryColor:Get.theme.primaryColor.withOpacity(0.2)))),
                      ),
                      onTap:status != 2? (){
                        modify!(true);
                      }:null,
                    ),
                    const Text("تغییر اطلاعات",style: TextStyle(fontSize: 16),)
                  ],
                ),
              ),
            ],
          ),
        )
      ],);
  }
  Widget getStatus(int status){
    switch(status){
      case 0:
        return Row(
          children:[
            Image.asset("assets/icons/check.png"),
            const Text("تایید شده",style: TextStyle(fontSize: 16,color: Colors.green))
          ],
        );
      case 1:
        return Row(
          children: [
            Image.asset("assets/icons/inProcess.png"),
            const Text("در انتظار تایید",style: TextStyle(fontSize: 16,color: Colors.yellow))
          ],
        );
      case 2:
        return Row(
          children: [
            Image.asset("assets/icons/reject.png"),
            const Text("تایید نشده",style: TextStyle(fontSize: 16,color: Colors.red))
          ],
        );
    }
    return Container();
  }
}