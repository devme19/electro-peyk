import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDialog extends StatelessWidget {
  String? title = "تعمیر";
  String? iconUrl = "assets/icons/repair.png";
  ProductDialog({Key? key}) : super(key: key);
  String? imageUrl = "assets/images/Rectangle.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          height: Get.height * 0.45,
          width: Get.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close)),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              )),
              Divider(
                thickness: 1.5,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "محصول",
                      style: MyTextStyle().style21,
                    ),
                    Text(
                      " “گوشی تصویری 10 اینچ مدل 1198”",
                      style: MyTextStyle().style22,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "چه سرویسی را برای محصول انتخابی خود در نظر دارید؟",
                style: MyTextStyle().style21,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customContainer(
                      title: "تعمیر", iconUrl: "assets/icons/repair.png"),
                  SizedBox(
                    width: 10,
                  ),
                  customContainer(
                      title: "نصب", iconUrl: "assets/icons/install.png")
                ],
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customContainer extends StatelessWidget {
  const customContainer({
    Key? key,
    required this.title,
    required this.iconUrl,
  }) : super(key: key);

  final String? title;
  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff1980FF), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff1980FF).withOpacity(0.1)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: MyTextStyle().style5,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(iconUrl!)
            ],
          ),
        ),
      ),
    );
  }
}
