import '../../core/either.dart';
import '../../core/failures.dart';
import '../../data/models/verification_model.dart';

abstract class AppRepository {
  ////////////////////// USER ///////////////////////////
  Future<Either<Failure, bool>> login(Map<String, dynamic> body);
  Future<Either<Failure, VerificationModel>> verification(
      Map<String, dynamic> body);
  ///////////////////// SETTING /////////////////////////
  Future<Either<Failure, bool>> setThemeMode(bool isDark);
  Future<Either<Failure, bool>> getThemeMode();
  Future<Either<Failure, bool>> setLanguage(bool isEn);
  Future<Either<Failure, bool>> getLanguage();
}
