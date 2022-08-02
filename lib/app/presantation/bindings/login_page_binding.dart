import 'package:electro_peyk/app/presantation/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../domain/repository/app_repository.dart';
import '../../domain/use_cases/user/login_use_case.dart';
import '../../domain/use_cases/user/verification_use_case.dart';
import '../controllers/auth_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
