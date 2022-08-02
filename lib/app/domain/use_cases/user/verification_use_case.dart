import '../../../core/either.dart';
import '../../../core/failures.dart';
import '../../../core/use_case.dart';
import '../../../data/models/verification_model.dart';
import '../../repository/app_repository.dart';

class VerificationUseCase implements UseCase<VerificationModel, Params> {
  final AppRepository repository;

  VerificationUseCase({required this.repository});

  @override
  Future<Either<Failure, VerificationModel>> call(Params params) {
    return repository.verification(params.body!);
  }
}
