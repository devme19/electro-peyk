import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
class SelectWidget extends StatefulWidget {
  SelectWidget({Key? key,this.selectedItem,this.title,this.value}) : super(key: key);
  ValueChanged<bool>? selectedItem;
  List<String>? value;
  String? title;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  bool? selectedItem=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title!,style: MyTextStyle().style2),
          Expanded(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: (){
                      setState(() {
                        selectedItem = true;
                        print(widget.value![0]+"0");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: selectedItem!?Get.theme.primaryColor:Get.theme.primaryColor.withOpacity(0.4),
                      ),

                      width: 80,height: 50,child: Center(child: Text(widget.value![0],style: MyTextStyle().style6)),)),
                SizedBox(width: 8.0,),
                InkWell(
                  onTap: (){
                    setState(() {
                      selectedItem = false;
                      print(widget.value![1]+"1");
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: !selectedItem!?Get.theme.primaryColor:Get.theme.primaryColor.withOpacity(0.4),
                    ),

                    width: 80,height: 50,child: Center(child: Text(widget.value![1],style: MyTextStyle().style6)),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
