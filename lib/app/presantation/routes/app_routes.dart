import 'package:electro_peyk/app/presantation/bindings/home_page_binding.dart';
import 'package:electro_peyk/app/presantation/bindings/sign_up_binding.dart';
import 'package:electro_peyk/app/presantation/pages/financial_page/financial_page.dart';
import 'package:electro_peyk/app/presantation/pages/login/login_page.dart';
import 'package:electro_peyk/app/presantation/pages/login/verification_page.dart';
import 'package:electro_peyk/app/presantation/pages/sign_up_page/sign_up_page.dart';
import 'package:electro_peyk/app/presantation/pages/splash_screen/splash_screen.dart';
import 'package:electro_peyk/app/presantation/pages/validation_page/validation_page.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../bindings/login_page_binding.dart';
import '../bindings/main_binding.dart';
import '../bindings/setting_page_binding.dart';
import '../pages/home/home_page.dart';

import '../pages/setting/setting_page.dart';

class AppRoutes {
  static const String homePage = "/homePage";
  static const String settingPage = "/settingPage";
  static const String splashScreen = "/splashPage";
  static const String loginPage = "/loginPage";
  static const String verificationPage = "/verificationPage";
  static const String validationPage = "/validationPage";
  static const String signUpPage = "/signUpPage";
  static const String financialPage = "/financialPage";
  static const String allProductPage = "/allProductPage";
}

class App {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.financialPage,
      page: () => FinancialPage(),
    ),
    GetPage(
      name: AppRoutes.validationPage,
      page: () => ValidationPage(),
    ),
    GetPage(
        name: AppRoutes.loginPage,
        transition: Transition.circularReveal,
        curve: Curves.linear,
        page: () => LoginPage(),
        binding: LoginPageBinding()),
    GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(),
        binding: HomePageBinding()),
    GetPage(
      name: AppRoutes.verificationPage,
      page: () =>  VerificationPage(),
        binding: LoginPageBinding()
    ),
    GetPage(
        name: AppRoutes.signUpPage,
        page: () => SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => const SettingPage(),
        bindings: [MainBinding(), SettingPageBinding()]),

  ];
}
