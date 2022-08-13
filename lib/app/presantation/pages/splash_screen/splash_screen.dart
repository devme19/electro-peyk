import 'dart:async';

import 'package:electro_peyk/app/presantation/routes/app_routes.dart';
import 'package:electro_peyk/app/presantation/theme/text_style.dart';
import 'package:electro_peyk/app/presantation/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double? top;
  bool moveUp = false;
  Animation? animationLogo;
  Animation? animationBg;
  AnimationController? logoColorAnimationController;
  AnimationController? bgColorAnimationController;
  animatedLogo() {
    Future.delayed(Duration(milliseconds: 2000)).then(
      (value) {
        setState(() {
          moveUp = true;

          print("MoveUp");
        });
      },
    );
  }

  animatedbgColor() {
    Future.delayed(Duration(milliseconds: 2100)).then(
      (value) {
        setState(() {
          bgColorAnimationController!.forward();
        });
      },
    );
  }

  animatedLogoColor() {
    Future.delayed(Duration(milliseconds: 3000)).then(
      (value) {
        setState(() {
          logoColorAnimationController!.forward();
        });
      },
    );
  }

  startAnimation() {
    animatedLogo();
    animatedbgColor();
    animatedLogoColor();
  }

  @override
  void initState() {
    super.initState();
    startAnimation();
    logoColorAnimationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    bgColorAnimationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animationLogo = ColorTween(begin: Color(0xffF2F2F7), end: Get.theme.primaryColor)
        .animate(logoColorAnimationController!)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    animationBg = ColorTween(begin: Get.theme.primaryColor, end: Color(0xffF2F2F7))
        .animate(bgColorAnimationController!)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    logoColorAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAndToNamed(AppRoutes.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: animationBg!.value,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 900),
                    top:
                        moveUp == false ? size.height * 0.4 : 65,
                    child: Image.asset(
                      "assets/images/logoWhite.png",
                      color: animationLogo!.value,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                "0.1 ورژن",
                style: MyTextStyle().style4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
