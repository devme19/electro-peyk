import 'package:flutter/material.dart';
class RowItemWidget extends StatelessWidget {
  RowItemWidget({Key? key,this.title,this.value,this.color}) : super(key: key);
  String? title;
  String? value;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(color == null?0:8),
        color: color!=null? color!.withOpacity(0.13): Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!,style: const TextStyle(fontSize: 12,color: Color(0xff1F1F24)),),
          color!= null?Text(value!,style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: 16)):Text(value!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff1F1F24))),
        ],
      ),
    );
  }
}
