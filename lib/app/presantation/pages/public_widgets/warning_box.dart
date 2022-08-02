import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';

class WarningBox extends StatelessWidget {
  WarningBox({Key? key, required this.text}) : super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.05),
      ),

      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            "متخصص گرامی:",
            style: MyTextStyle().style11,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text!,
              style: MyTextStyle().style12,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
