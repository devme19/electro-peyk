import '../../../../core/either.dart';
import '../../../../core/failures.dart';
import '../../../../core/use_case.dart';
import '../../../repository/app_repository.dart';

class SetLanguageUseCase implements UseCase<bool, Params> {
  final AppRepository? repository;

  SetLanguageUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository!.setLanguage(params.boolValue!);
  }
}
