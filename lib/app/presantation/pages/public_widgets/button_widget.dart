import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key, this.onPress, this.text}) : super(key: key);

  VoidCallback? onPress;
  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: onPress,
      child: Text(
        text!,
        style: MyTextStyle().style6,
      ),
    );
  }
}
