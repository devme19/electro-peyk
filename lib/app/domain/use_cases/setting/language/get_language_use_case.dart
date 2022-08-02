import '../../../../core/either.dart';
import '../../../../core/failures.dart';
import '../../../../core/use_case.dart';
import '../../../repository/app_repository.dart';

class GetLanguageUseCase implements UseCase<bool, NoParams> {
  final AppRepository? repository;

  GetLanguageUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository!.getLanguage();
  }
}
