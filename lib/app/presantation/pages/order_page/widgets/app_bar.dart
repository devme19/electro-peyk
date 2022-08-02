import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffE5E5EA)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff1980FF),
                        )),
                    Text(
                      "تهران",
                      style: MyTextStyle().style12,
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 6,
              child: SizedBox(
                height: 49,
                child: TextField(
                  style: MyTextStyle().style12,
                  decoration: InputDecoration(
                      prefixIcon: InkWell(
                          onTap: () {},
                          child: Image.asset("assets/icons/search.png")),
                      contentPadding: EdgeInsets.only(top: 10, right: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                      fillColor: Color(0xffE5E5EA),
                      hintText: "به دنبال چه محصولی هستید؟",
                      hintStyle: MyTextStyle().style16),
                  textAlign: TextAlign.right,
                ),
              ))
        ],
      ),
    );
  }
}
