import 'package:get/get.dart';
import '../../domain/repository/app_repository.dart';
import '../../domain/use_cases/setting/language/get_language_use_case.dart';
import '../../domain/use_cases/setting/language/set_language_use_case.dart';
import '../../domain/use_cases/setting/theme/get_theme_mode_use_case.dart';
import '../../domain/use_cases/setting/theme/set_theme_mode_use_case.dart';
import '../controllers/setting_controller.dart';

class SettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetThemeModeUseCase>(
        () => SetThemeModeUseCase(repository: Get.find<AppRepository>()));
    Get.lazyPut<GetThemeModeUseCase>(
        () => GetThemeModeUseCase(repository: Get.find<AppRepository>()));
    Get.lazyPut<SetLanguageUseCase>(
        () => SetLanguageUseCase(repository: Get.find<AppRepository>()));
    Get.lazyPut<GetLanguageUseCase>(
        () => GetLanguageUseCase(repository: Get.find<AppRepository>()));
    Get.lazyPut(() => SettingController());
  }
}
