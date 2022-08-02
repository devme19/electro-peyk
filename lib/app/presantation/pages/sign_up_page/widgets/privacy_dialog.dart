import 'package:electro_peyk/app/presantation/pages/public_widgets/button_widget.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyDialog extends StatelessWidget {
  const PrivacyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  color: IColor().LIGHT_BG_COLOR,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: RawScrollbar(
                mainAxisMargin: 20,
                radius: Radius.circular(8),
                thickness: 12,
                thumbColor: IColor().LIGHT_PRIMARY_COLOR,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و ",
                      style: Themes.light.textTheme.headline6,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ButtonWidget(
            text: "موافقم",
            onPress: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
