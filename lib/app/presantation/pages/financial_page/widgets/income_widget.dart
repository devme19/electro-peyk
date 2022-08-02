import 'package:electro_peyk/app/presantation/pages/financial_page/widgets/box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class IncomeWidget extends StatelessWidget {
  bool isCardAdded;
  ValueChanged<bool>? addCard;
  IncomeWidget({Key? key,this.isCardAdded=false,this.addCard}) : super(key: key);
  var formatter = NumberFormat('#,###,000');
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
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
            )
            ,
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("تومان",style: TextStyle(fontSize: 16,color: Colors.green)),
                    const SizedBox(width: 5.0,),
                    Text(formatter.format(120000),style: const TextStyle(fontSize: 16,color: Colors.green),)
                  ],
                ),
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("میزان درآمد تسویه نشده",style: TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 16.0,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: BoxWidget(title: "برداشت کل", value: formatter.format(10000))),
                      const SizedBox(width: 16.0,),
                      Expanded(child: BoxWidget(title: "درآمد کل", value: formatter.format(2504000))),
                      const SizedBox(width: 16.0,),
                      Expanded(child: BoxWidget(title: "درآمد ماهانه", value: formatter.format(20000)))
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
                          child: Center(child: Text(isCardAdded?"تغییر":"افزودن",style: TextStyle(fontSize: 16,color:Get.theme.primaryColor))),
                        ),
                        onTap: (){
                          if(isCardAdded){
                            addCard!(false);
                          }else{
                            addCard!(true);
                          }
                        },
                      ),
                      const Text("اطلاعات بانکی",style: TextStyle(fontSize: 16),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("تراکنش ها",style: TextStyle(fontSize: 16,color: Colors.black)),
            )
            ],
          ),
          Column(
            children: [
              transactionBox(isDeposit: true,value: 1255542200,code: "12334466"),
              const SizedBox(height: 2,),
              transactionBox(isDeposit: false,value: 322500,code: "9888655"),
              const SizedBox(height: 2,),
              transactionBox(isDeposit: false,value: 87000,code: "9888655"),
              const SizedBox(height: 2,),
              transactionBox(isDeposit: true,value: 80009000,code: "12334466"),
            ],
          ),
        ],),
      );
  }

  Widget transactionBox({bool? isDeposit, String? code, int? value}){
    return Container(
      height: 100,
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("تومان ",style: TextStyle(fontSize: 16,color: isDeposit!?Colors.green:Colors.red)),
                  Text(isDeposit?"+":"-",style: TextStyle(fontSize: 16,color: isDeposit?Colors.green:Colors.red)),
                  Text(formatter.format(value),style: TextStyle(fontSize: 16,color: isDeposit?Colors.green:Colors.red)),

                ],
              ),
              Text(isDeposit?"پرداخت مشتری":"برداشت",style: TextStyle(fontSize: 16,color: isDeposit?Colors.green:Colors.red)),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(code!,style: const TextStyle(fontSize: 16)),
              const Text(" :کدپیگیری",style: TextStyle(fontSize: 16)),
            ],
          ),
        ],),
    );
  }
}
