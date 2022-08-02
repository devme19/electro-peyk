import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddCardWidget extends StatelessWidget {
  ValueChanged<bool>? back;
  AddCardWidget({Key? key,this.back}) : super(key: key);
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Expanded(child: Text("شماره کارت",style: TextStyle(fontSize: 16),textAlign: TextAlign.right,)),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          prefix: Text("IR")
                        ),
                      ),
                    ),
                    Expanded(child: Text("شبا",style: TextStyle(fontSize: 16),textAlign: TextAlign.right)),
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
                            color: Colors.green.withOpacity(0.1),
                            border: Border.all(color:Colors.green)
                        ),
                        child: const Center(child: Text("ثبت",style: TextStyle(fontSize: 16,color:Colors.green))),
                      ),
                      onTap:(){
                      },
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