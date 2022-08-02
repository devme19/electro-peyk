import '../../../../core/either.dart';
import '../../../../core/failures.dart';
import '../../../../core/use_case.dart';
import '../../../repository/app_repository.dart';

class SetThemeModeUseCase implements UseCase<bool, Params> {
  final AppRepository? repository;

  SetThemeModeUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository!.setThemeMode(params.boolValue!);
  }
}
