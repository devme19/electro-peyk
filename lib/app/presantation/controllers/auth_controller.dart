
import 'package:get/get.dart';

import '../../core/failures.dart';
import '../../core/use_case.dart';
import '../../domain/use_cases/user/login_use_case.dart';
import '../../domain/use_cases/user/verification_use_case.dart';
import '../routes/app_routes.dart';
import '../utils/state_status.dart';

class AuthController extends GetxController {
  var loginStateStatus = StateStatus.INITIAL.obs;
  var verificationStateStatus = StateStatus.INITIAL.obs;
  String? phoneNumber;
  login(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    loginStateStatus.value = StateStatus.LOADING;
    LoginUseCase loginUseCase = Get.find();
    Map<String, dynamic> body = {
      'phone': phoneNumber,
    };
    loginUseCase.call(Params(body: body)).then((response) {
      if (response.isRight) {
        loginStateStatus.value = StateStatus.SUCCESS;
      } else {
        if (response.isLeft) {
          loginStateStatus.value = StateStatus.ERROR;
          print("Error");
          response.left;
        }
      }
    });
  }

  verification(String code) {
    verificationStateStatus.value = StateStatus.LOADING;
    VerificationUseCase verificationUseCase = Get.find();
    Map<String, dynamic> body = {'phone': phoneNumber, 'token': code};
    verificationUseCase.call(Params(body: body)).then((response) {
      if (response.isRight) {
        verificationStateStatus.value = StateStatus.SUCCESS;
        Get.offAndToNamed(AppRoutes.homePage);
      } else {
        if (response.isLeft) {
          verificationStateStatus.value = StateStatus.ERROR;
          ServerFailure failure = response.left as ServerFailure;
          if (failure.errorCode == 401) {
          }
          print("Error");
        }
      }
    });
  }
}
