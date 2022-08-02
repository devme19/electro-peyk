import 'package:electro_peyk/app/presantation/controllers/login_controller.dart';
import 'package:electro_peyk/app/presantation/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../domain/repository/app_repository.dart';
import '../../domain/use_cases/user/login_use_case.dart';
import '../../domain/use_cases/user/verification_use_case.dart';
import '../controllers/auth_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
