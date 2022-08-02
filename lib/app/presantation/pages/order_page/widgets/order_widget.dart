import 'package:electro_peyk/app/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({Key? key,this.orderItem,this.isService=false}) : super(key: key);
  OrderModel? orderItem;
  bool? isService;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child:
      Container(
        height: Get.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

        ),

        child: Row(
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  repair(orderItem!.title!,orderItem!.isRepair!),
                  rowItem(":آدرس حدودی", orderItem!.address!),
                  rowItem(":کدپیگیری", orderItem!.code!),
                  rowItem(":زمان", orderItem!.date!),
                  orderItem!.status!= null && isService!?
                  getStatus(orderItem!.status!):
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(8.0),

                          child: Center(child: Text("رد سرویس",style: TextStyle(fontSize: 16,color:Colors.red))),
                        ),
                        onTap:(){

                        },
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Get.theme.primaryColor.withOpacity(0.1),
                              border: Border.all(color:Get.theme.primaryColor)
                          ),
                          child: Center(child: Text("قبول سرویس",style: TextStyle(fontSize: 13,color:Get.theme.primaryColor))),
                        ),
                        onTap:(){

                        },
                      ),
                    ],),
                ],),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              width: Get.width*0.35,
              height: Get.width*0.35,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: const Color(0xffE5E5EA))
              ),
              child: Image.asset(orderItem!.imageUrl!,fit: BoxFit.cover),
            )
          ],
        ),
      )
    );
  }
  Widget rowItem(String title,String value){
    return Row(
      children: [
      Expanded(
        child: Text(value,style: const TextStyle(fontSize:12,color: Color(
            0xff1f2424),fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),textAlign: TextAlign.right),
      ),
      Text("$title",style: TextStyle(fontSize:11,color: Color(0xff1F1F24).withOpacity(0.7)),textAlign: TextAlign.right,),
    ],);
  }
  Widget repair(String title,bool isRepair){
    return Row(
      children: [
        Expanded(child: Text(title,style: const TextStyle(fontSize:12,color: Color(0xff1F1F24),fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),textAlign: TextAlign.right)),
        Text(isRepair?" تعمیر":"نصب ",style: TextStyle(color: Get.theme.primaryColor),textAlign: TextAlign.right,),
        Image.asset(isRepair?"assets/icons/repair.png":"assets/icons/install.png"),
      ],
    );
  }
  Widget getStatus(Status status){
    switch (status){
      case Status.rejectByClient:
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.red.withOpacity(0.1),
                ),
                child: 
                FittedBox(child: Text("این سرویس توسط مشتری لغو شده است",style: TextStyle(color: Colors.red),)),
              ),
            ),
          ],
        );
      case Status.accepted:
        return Row(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Center(child: FittedBox(child: Text("رد سرویس",style: TextStyle(color: Colors.red),))),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Get.theme.primaryColor.withOpacity(0.1)
              ),
              child: Center(child: FittedBox(child: Text("سرویس قبول شده",style: TextStyle(color: Get.theme.primaryColor),))),
            ),
          )
        ],);
      case Status.done:
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.green.withOpacity(0.1)
                ),
                child: Center(child: FittedBox(child: Text("تکمیل شده",style: TextStyle(color: Colors.green),))),
              ),
            ),
          ],
        );
      case Status.reject:
        return Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.red.withOpacity(0.1),
          ),
          child:
          Center(child: FittedBox(child: Text("این سرویس توسط شما لغو شده است",style: TextStyle(color: Colors.red),))),
        );
    }
  }
}
