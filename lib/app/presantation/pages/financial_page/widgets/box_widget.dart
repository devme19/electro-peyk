import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BoxWidget extends StatelessWidget {
  BoxWidget({Key? key,this.title,this.value}) : super(key: key);
  String? title;
  String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width/3.5,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border:Border.all(color: Colors.grey.shade300)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value!,style: TextStyle(color: Get.theme.primaryColor,fontSize: 16),),
          const SizedBox(height: 20.0,),
          FittedBox(child: Text(title!))
        ],),
    );
  }
}
