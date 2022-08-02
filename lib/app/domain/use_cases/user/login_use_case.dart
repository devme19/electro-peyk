import '../../../core/either.dart';
import '../../../core/failures.dart';
import '../../../core/use_case.dart';
import '../../repository/app_repository.dart';

class LoginUseCase implements UseCase<bool, Params> {
  final AppRepository repository;

  LoginUseCase({required this.repository});
  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository.login(params.body!);
  }
}
